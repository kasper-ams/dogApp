//
//  UserManager.swift
//  dogApp
//
//  Created by Kaspars Jelaiskis on 22/12/2023.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift
import Combine



struct ItemData: Identifiable, Codable {
    
    let id: Int
    let text: String?
    let image: String?
}


struct Movie: Codable {
    let id: String
    let title: String
    let isPopular: Bool
}

struct DBUser: Codable {
    let userId: String
    let isAnonymous: Bool?
    let email: String?
    let photoUrl: String?
    let dateCreated: Date?
    let isPremium: Bool?
    let preferences: [String]?
    let favoriteItem: ItemData?
    let favoriteMovie: Movie?
    let profileImagePath: String?
    let profileImagePathUrl: String?

    init(auth: AuthDataResultModel) {
        self.userId = auth.uid
        self.isAnonymous = auth.isAnonymous
        self.email = auth.email
        self.photoUrl = auth.photoUrl
        self.dateCreated = Date()
        self.isPremium = false
        self.preferences = nil
        self.favoriteItem = nil
        self.favoriteMovie = nil
        self.profileImagePath = nil
        self.profileImagePathUrl = nil
    }
    
    init(
        userId: String,
        isAnonymous: Bool? = nil,
        email: String? = nil,
        photoUrl: String? = nil,
        dateCreated: Date? = nil,
        isPremium: Bool? = nil,
        preferences: [String]? = nil,
        favoriteItem: ItemData? = nil,
        favoriteMovie: Movie? = nil,
        profileImagePath: String? = nil,
        profileImagePathUrl: String? = nil
    ) {
        self.userId = userId
        self.isAnonymous = isAnonymous
        self.email = email
        self.photoUrl = photoUrl
        self.dateCreated = dateCreated
        self.isPremium = isPremium
        self.preferences = preferences
        self.favoriteItem = favoriteItem
        self.favoriteMovie = favoriteMovie
        self.profileImagePath = profileImagePath
        self.profileImagePathUrl = profileImagePathUrl
    }
    

    
    enum CodingKeys: String, CodingKey {
        case userId = "user_id"
        case isAnonymous = "is_anonymous"
        case email = "email"
        case photoUrl = "photo_url"
        case dateCreated = "date_created"
        case isPremium = "user_isPremium"
        case preferences = "preferences"
        case favoriteItem = "favorite_item"
        case favoriteMovie = "favorite_movie"
        case profileImagePath = "profile_image_path"
        case profileImagePathUrl = "profile_image_path_url"
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.userId = try container.decode(String.self, forKey: .userId)
        self.isAnonymous = try container.decodeIfPresent(Bool.self, forKey: .isAnonymous)
        self.email = try container.decodeIfPresent(String.self, forKey: .email)
        self.photoUrl = try container.decodeIfPresent(String.self, forKey: .photoUrl)
        self.dateCreated = try container.decodeIfPresent(Date.self, forKey: .dateCreated)
        self.isPremium = try container.decodeIfPresent(Bool.self, forKey: .isPremium)
        self.preferences = try container.decodeIfPresent([String].self, forKey: .preferences)
        self.favoriteItem = try container.decodeIfPresent(ItemData.self, forKey: .favoriteItem)
        self.favoriteMovie = try container.decodeIfPresent(Movie.self, forKey: .favoriteMovie)
        self.profileImagePath = try container.decodeIfPresent(String.self, forKey: .profileImagePath)
        self.profileImagePathUrl = try container.decodeIfPresent(String.self, forKey: .profileImagePathUrl)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.userId, forKey: .userId)
        try container.encodeIfPresent(self.isAnonymous, forKey: .isAnonymous)
        try container.encodeIfPresent(self.email, forKey: .email)
        try container.encodeIfPresent(self.photoUrl, forKey: .photoUrl)
        try container.encodeIfPresent(self.dateCreated, forKey: .dateCreated)
        try container.encodeIfPresent(self.isPremium, forKey: .isPremium)
        try container.encodeIfPresent(self.preferences, forKey: .preferences)
        try container.encodeIfPresent(self.favoriteItem, forKey: .favoriteItem)
        try container.encodeIfPresent(self.favoriteMovie, forKey: .favoriteMovie)
        try container.encodeIfPresent(self.profileImagePath, forKey: .profileImagePath)
        try container.encodeIfPresent(self.profileImagePathUrl, forKey: .profileImagePathUrl)
    }
    
}

final class UserManager {
    
    static let shared = UserManager()
    private init() { }

    func getAllUserFavoriteItems(userId: String) async throws -> [UserFavoriteItem] {
        try await userFavoriteItemCollection(userId: userId).getDocuments(as: UserFavoriteItem.self)
    }
    
    private let userCollection: CollectionReference = Firestore.firestore().collection("users")
    
    private func userDocument(userId: String) -> DocumentReference {
        userCollection.document(userId)
    }
    
    func addUserFavoriteItem(userId: String, itemtId: Int) async throws {
        let document = userFavoriteItemCollection(userId: userId).document("\(itemtId)")
        
        let data: [String: Any] = [
            UserFavoriteItem.CodingKeys.id.rawValue: "\(itemtId)",
            UserFavoriteItem.CodingKeys.itemtId.rawValue: itemtId,
            UserFavoriteItem.CodingKeys.dateCreated.rawValue: Timestamp()
        ]
        
        try await document.setData(data, merge: false)
    }

    
    func removeUserFavoriteItem(userId: String, favoriteItemId: Int) async throws {
        try await userFavoriteItemDocument(userId: userId, favoriteItemId: favoriteItemId).delete()
    }
    
    private func userFavoriteItemDocument(userId: String, favoriteItemId: Int) -> DocumentReference {
        userFavoriteItemCollection(userId: userId).document("\(favoriteItemId)")
    }
  
    private let encoder: Firestore.Encoder = {
        let encoder = Firestore.Encoder()
        return encoder
    }()
    
    private let decoder: Firestore.Decoder = {
        let decoder = Firestore.Decoder()
        return decoder
    }()
    
    
    func createNewUser(user: DBUser) async throws {
        try userDocument(userId: user.userId).setData(from: user, merge: false)
    }
    
    func createNewUser(auth: AuthDataResultModel) async throws {
        var userData: [String:Any] = [
            "user_id" : auth.uid,
            "is_anonymous" : auth.isAnonymous,
            "date_created" : Timestamp(),
        ]
        if let email = auth.email {
            userData["email"] = email
        }
        
        try await userDocument(userId: auth.uid).setData(userData, merge: false)
    }
    
    func getUser(userId: String) async throws -> DBUser {
        try await userDocument(userId: userId).getDocument(as: DBUser.self)
    }
    
    
    func getUserLessons(userId: String) async throws -> [Lesson] {
        let lessonsCollectionRef = userDocument(userId: userId).collection("lessons")

        let querySnapshot = try await lessonsCollectionRef.getDocuments()
        let lessons = querySnapshot.documents.compactMap { document -> Lesson? in
            do {
                return try document.data(as: Lesson.self)
            } catch {
                print("Error decoding lesson: \(error)")
                return nil
            }
        }

        return lessons
    }
    
    func getUserPrograms(userId: String) async throws -> [UserProgram] {
        let userProgramCollectionRef = userDocument(userId: userId).collection("user_programs")
        
        let querySnapshot = try await userProgramCollectionRef.getDocuments()
        let userPrograms = querySnapshot.documents.compactMap { document -> UserProgram? in
            do {
                return try document.data(as: UserProgram.self)
            } catch {
                print("Error decoding user program: \(error)")
                return nil
            }
        }
        
        return userPrograms
    }
    
    func getUserProgramStatus(userId: String, programId: Int) async throws -> String {
            do {
                let document = userProgramCollection(userId: userId).document("\(programId)")
                let snapshot = try await document.getDocument()
                
                if let data = snapshot.data(), let status = data[UserProgram.CodingKeys.status.rawValue] as? String {
                    return status
                } else {
                    return ProgramStatusFirst.notStarted.rawValue
                }
            } catch {
                throw error
            }
        }
    
   
    // MARK: favorites
    
    func getFavoriteItems(userId: String) async throws -> [FavoriteItemData] {
            let favoriteItemsCollectionRef = userDocument(userId: userId).collection("favorite_items")
            
            let querySnapshot = try await favoriteItemsCollectionRef.getDocuments()
            let favoriteItems = querySnapshot.documents.compactMap { document -> FavoriteItemData? in
                do {
                    return try document.data(as: FavoriteItemData.self)
                } catch {
                    print("Error decoding favorite item: \(error)")
                    return nil
                }
            }
            
            return favoriteItems
        }
    
    func addFavoriteItemUM(userId: String, item: ItemData) async throws {
        let db = Firestore.firestore()
        
        // Reference to the "favorite_items" subcollection
        let favoriteItemsCollectionRef = db.collection("users").document(userId).collection("favorite_items")
        
        // Add the item to the "favorite_items" subcollection
        let documentRef = try favoriteItemsCollectionRef.addDocument(from: item)
        
        // Print the generated document ID (optional, for debugging)
        print("Document added with ID: \(documentRef.documentID)")
    }
    
    
    func removeFavoriteItemUM(userId: String, itemId: Int) async throws {
            let favoriteItemDocumentRef = userFavoriteItemDocument(userId: userId, favoriteItemId: itemId)
            
            do {
                // Attempt to delete the document
                try await favoriteItemDocumentRef.delete()
                // If successful, print a message
                print("Favorite item removed with ID: \(itemId)")
            } catch {
                // If the document does not exist, print a message but do not treat it as an error
                print("Favorite item with ID \(itemId) not found. It may have already been removed.")
            }
        }
    
    private func userFavoriteItemCollection(userId: String) -> CollectionReference {
        userDocument(userId: userId).collection("favorite_items")
    }
    
    private var userFavoriteItemsListener: ListenerRegistration? = nil
    
    func addListenerForAllUserFavoriteItems(userId: String) -> AnyPublisher<[UserFavoriteItem], Error> {
        let (publisher, listener) = userFavoriteItemCollection(userId: userId)
            .addSnapshotListener(as: UserFavoriteItem.self)
        
        self.userFavoriteItemsListener = listener
        return publisher
    }
    
    // MARK: programs
    
    private var userLessonsListener: ListenerRegistration? = nil

    
    func addListenerForUserLessons(userId: String) -> AnyPublisher<[Lesson], Error> {
        let (publisher, listener) = userLessonsCollection(userId: userId)
            .addSnapshotListener(as: Lesson.self)
        
        self.userLessonsListener = listener
        return publisher
    }
    
    func updateProgramStatusInFirestore(userId: String, programId: Int, status: String) async throws {
        let document = userProgramCollection(userId: userId).document("\(programId)")
        
        let data: [String: Any] = [
            UserProgram.CodingKeys.id.rawValue: "\(programId)",
            UserProgram.CodingKeys.programId.rawValue: programId,
            UserProgram.CodingKeys.dateCreated.rawValue: Timestamp(),
            UserProgram.CodingKeys.status.rawValue: "\(status)"
        ]
        
        try await document.setData(data, merge: false)
    }
    
    
    
    // creates a new collection "lessons" in "users"/id
    func updateLessonStatus(userId: String, lessonId: Int) async throws {
        let userProgramCollection = userLessonsCollection(userId: userId)
        let document = userLessonsCollection(userId: userId).document("\(lessonId)")

        let data: [String: Any] = [
            Lesson.CodingKeys.id.rawValue: "\(lessonId)",
            Lesson.CodingKeys.lessonId.rawValue: lessonId,
            Lesson.CodingKeys.dateCreated.rawValue: Timestamp(),
            Lesson.CodingKeys.status.rawValue: "lessonCompleted"
        ]

        try await document.setData(data, merge: false)
    }
    

    
    func removeLesson(userId: String, lessonId: Int) async throws {
            let userLessonsCollectionRef = userLessonsCollection(userId: userId).document("\(lessonId)")

            try await userLessonsCollectionRef.delete()
        }
    
    
    
    func addUserProgram(programId: Int) {
        Task {
            do {
                let authDataResult = try AuthenticationManager.shared.getAuthenticatedUser()
                let userId = authDataResult.uid
                let status = "inProgress"
                try? await UserManager.shared.updateProgramStatusInFirestore(userId: userId, programId: programId, status: status)
            } catch {
                print("Error getting authenticated user: \(error)")
            }
        }
    }
    
    func completeUserProgram(programId: Int) {
        Task {
            do {
                let authDataResult = try AuthenticationManager.shared.getAuthenticatedUser()
                let userId = authDataResult.uid
                let status = "completed"
                try? await UserManager.shared.updateProgramStatusInFirestore(userId: userId, programId: programId, status: status)
            } catch {
                print("Error getting authenticated user: \(error)")
            }
        }
    }
}

extension UserManager {
    // Function to check if the item is in favorites
    func isItemInFavorites(favoriteItemtId: Int) async throws -> Bool {
        let user = try await AuthenticationManager.shared.getAuthenticatedUser()
        let favoriteItems = try await getFavoriteItems(userId: user.uid)
        return favoriteItems.contains { $0.id == favoriteItemtId }
    }
    
    func isLessonCompleted(lessonId: Int) async throws -> Bool {
            let user = try await AuthenticationManager.shared.getAuthenticatedUser()
            let lessons = try await getUserLessons(userId: user.uid)
            return lessons.contains { $0.id == "\(lessonId)" }
        }
}
 
import Combine

struct UserFavoriteItem: Codable {
    let id: String
    let itemtId: Int
    let dateCreated: Date
    
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case itemtId = "item_id"
        case dateCreated = "date_created"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.itemtId = try container.decode(Int.self, forKey: .itemtId)
        self.dateCreated = try container.decode(Date.self, forKey: .dateCreated)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.itemtId, forKey: .itemtId)
        try container.encode(self.dateCreated, forKey: .dateCreated)
    }
    
    
}


private func userProgramCollection(userId: String) -> CollectionReference {
    userDocument(userId: userId).collection("user_programs")
}

private func userLessonsCollection(userId: String) -> CollectionReference {
    userDocument(userId: userId).collection("lessons")

}

private func userFavoriteItemCollection(userId: String) -> CollectionReference {
    userDocument(userId: userId).collection("favorite_items")
}

private func userDocument(userId: String) -> DocumentReference {
    userCollection.document(userId)
}

private let userCollection: CollectionReference = Firestore.firestore().collection("users")


struct UserProgram: Codable {
    let id: String
    let programId: Int
    let dateCreated: Date
    let status: String
    
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case programId = "program_id"
        case dateCreated = "date_created"
        case status = "status"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.programId = try container.decode(Int.self, forKey: .programId)
        self.dateCreated = try container.decode(Date.self, forKey: .dateCreated)
        self.status = try container.decode(String.self, forKey: .status)

    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.programId, forKey: .programId)
        try container.encode(self.dateCreated, forKey: .dateCreated)
        try container.encode(self.status, forKey: .status)

    }
    
    
}

struct Lesson: Codable, Equatable {
    let id: String
    let lessonId: Int
    let dateCreated: Date
    let status: String
    
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case lessonId = "lesson_id"
        case dateCreated = "date_created"
        case status = "status"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.lessonId = try container.decode(Int.self, forKey: .lessonId)
        self.dateCreated = try container.decode(Date.self, forKey: .dateCreated)
        self.status = try container.decode(String.self, forKey: .status)

    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.lessonId, forKey: .lessonId)
        try container.encode(self.dateCreated, forKey: .dateCreated)
        try container.encode(self.status, forKey: .status)

    }
    
    
}



