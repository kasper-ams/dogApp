//
//  ProfileViewModel.swift
//  dogApp
//
//  Created by Kaspars Jelaiskis on 22/12/2023.
//

import Foundation
import SwiftUI
import PhotosUI
import Firebase
import FirebaseAuth

@MainActor
final class AuthStateManager: ObservableObject {
    @Published var isSignedIn: Bool = false

    init() {
        // Subscribe to authentication state changes
        Auth.auth().addStateDidChangeListener { [weak self] (_, user) in
            DispatchQueue.main.async {
                self?.isSignedIn = user != nil
            }
        }
    }
}

@MainActor
final class ProfileViewModel: ObservableObject {
    
    @Published private(set) var user: DBUser? = nil
    @Published private(set) var favoriteItems: [FavoriteItemData] = []
    @EnvironmentObject private var authStateManager: AuthStateManager

    
    var isSignedIn: Bool {
        return Auth.auth().currentUser != nil
       }
    
    func loadCurrentUser() async throws {
        do {
            let authDataResult = try AuthenticationManager.shared.getAuthenticatedUser()
            self.user = try await UserManager.shared.getUser(userId: authDataResult.uid)
            print("User loaded successfully with email: \(user?.email ?? "Unknown")")
        } catch {
            print("Error loading user: \(error)")
        }
    }
    
    func signOut() throws {
       try AuthenticationManager.shared.signOut()
    }
    
    func loadFavoriteItems() async {
        guard authStateManager.isSignedIn else {
            print("Cannot load favorite items, user is not signed in.")
            return
        }
        
        
        //    func loadFavoriteItems() async {
        //            do {
        //                guard isSignedIn else {
        //                    print("Cannot load favorite items, user is not signed in.")
        //                    return
        //                }
        //
        //                guard let userId = user?.userId else {
        //                    print("Error: User is nil when loading favorite items.")
        //                    return
        //                }
        //
        //                self.favoriteItems = try await UserManager.shared.getFavoriteItems(userId: userId)
        //                print("Favorite items loaded successfully: \(favoriteItems)")
        //            } catch {
        //                print("Error loading favorite items: \(error)")
        //                // Handle the error as needed
        //            }
        //        }
        
        func refresh() async {
            do {
                try await loadCurrentUser()
                if authStateManager.isSignedIn {
                    try await loadFavoriteItems()
                }
            } catch {
                print("Error refreshing profile: \(error)")
            }
        }
    }
    
//    func refresh() async {
//            do {
//                try await loadCurrentUser()
//                if isSignedIn {
//                    try await loadFavoriteItems()
//                }
//            } catch {
//                print("Error refreshing profile: \(error)")
//            }
//        }
//    
    
    
//    func togglePremiumStatus() {
//        guard let user else { return }
//        let currentValue = user.isPremium ?? false
//        Task {
//            try await UserManager.shared.updateUserPremiumStatus(userId: user.userId, isPremium: !currentValue)
//            self.user = try await UserManager.shared.getUser(userId: user.userId)
//        }
//    }
    
//    func addUserPreference(text: String) {
//        guard let user else { return }
//        
//        Task {
//            try await UserManager.shared.addUserPreference(userId: user.userId, preference: text)
//            self.user = try await UserManager.shared.getUser(userId: user.userId)
//        }
//    }
//    
//    func removeUserPreference(text: String) {
//        guard let user else { return }
//        
//        Task {
//            try await UserManager.shared.removeUserPreference(userId: user.userId, preference: text)
//            self.user = try await UserManager.shared.getUser(userId: user.userId)
//        }
//    }
    
 
    
//    func addFavoriteItem() {
//        guard let user else { return }
//        let item = ItemData(id: "1", text: "Text", image: "image")
//        Task {
//            try await UserManager.shared.addFavoriteItemUM(userId: user.userId, item: item)
//            self.user = try await UserManager.shared.getUser(userId: user.userId)
//            print("added favorite item \(item)")
//        }
//    }
    
    
    
//    func removeFavoriteItem(itemId: String) async throws {
//        do {
//            try await UserManager.shared.removeFavoriteItemUM(userId: user?.userId ?? "", itemId: itemId)
//            // Optionally, update the local list of favorite items after removal
//            await loadFavoriteItems()
//            print("Favorite item removed with ID: \(itemId)")
//        } catch {
//            print("Error removing favorite item: \(error)")
//            // Handle the error as needed, such as showing an alert to the user
//        }
//    }
    
//    func addFavoriteItem(userId: String, item: ItemData) async throws {
//        guard let data = try? encoder.encode(item) else {
//            throw URLError(.badURL)
//        }
//        
//        let dict: [String:Any] = [
//            DBUser.CodingKeys.favoriteItem.rawValue : data
//        ]
//
//        try await userDocument(userId: userId).updateData(dict)
//    }
    
   
  
    
    
//    func saveProfileImage(item: PhotosPickerItem) {
//        guard let user else { return }
//
//        Task {
//            guard let data = try await item.loadTransferable(type: Data.self) else { return }
//            let (path, name) = try await StorageManager.shared.saveImage(data: data, userId: user.userId)
//            print("SUCCESS!")
//            print(path)
//            print(name)
//            let url = try await StorageManager.shared.getUrlForImage(path: path)
//            try await UserManager.shared.updateUserProfileImagePath(userId: user.userId, path: path, url: url.absoluteString)
//        }
//    }
//    
//    func deleteProfileImage() {
//        guard let user, let path = user.profileImagePath else { return }
//
//        Task {
//            try await StorageManager.shared.deleteImage(path: path)
//            try await UserManager.shared.updateUserProfileImagePath(userId: user.userId, path: nil, url: nil)
//        }
//    }
    
}
