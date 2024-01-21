//
//  FavouriteItemData.swift
//  dogApp
//
//  Created by Kaspars Jelaiskis on 26/12/2023.
//

import Foundation
import FirebaseFirestore


struct FavoriteItemData: Codable, Identifiable {
    let text: String
    let image: String
    let id: Int
    let description: String?
    let summary: String?
}



func saveFaveItem(item: FavoriteItemData, userId: String, completion: @escaping (String?) -> Void) {
    let db = Firestore.firestore()

    // Use the user's document ID as the parent document
    let userDocumentRef = db.collection("users").document(userId)

    // Generate a new UUID for the item
    let itemId = UUID().uuidString

    // Specify the document ID of the item to be added within the "favorite_items" subcollection
    let favoriteItemRef = userDocumentRef.collection("favorite_items").document(itemId)

    // Add the item to the "favorite_items" subcollection with the specified ID
    favoriteItemRef.setData([
        "text": item.text,
        "image": item.image,
        "id": itemId
    ]) { err in
        if let err = err {
            print("Error adding document with ID \(itemId): \(err)")
            completion(nil)
        } else {
            print("Document with ID \(itemId) added to the 'favorite_items' subcollection")
            completion(itemId)
        }
    }
}





func removeFaveItem(uniqueItemId: String, userId: String, completion: @escaping () -> Void) {
    let db = Firestore.firestore()

    // Use the user's document ID as the parent document
    let userDocumentRef = db.collection("users").document(userId)

    // Specify the document ID of the item to be removed within the "favorite_items" subcollection
    let favoriteItemRef = userDocumentRef.collection("favorite_items").document(uniqueItemId)

    // Retrieve the item ID before removing it
    favoriteItemRef.getDocument { (document, error) in
        if let document = document, document.exists {
            // Document exists, retrieve the item ID
            if let itemId = document.data()?["id"] as? String {
                // Now remove the item
                favoriteItemRef.delete { err in
                    if let err = err {
                        print("Error removing document with ID \(uniqueItemId): \(err)")
                    } else {
                        print("Document with ID \(uniqueItemId) removed from the 'favorite_items' subcollection")
                        completion()
                    }
                }
            } else {
                // Handle the case where the item ID is missing
                print("Error: Item ID is missing for document with ID \(uniqueItemId)")
                completion()
            }
        } else {
            // Handle the case where the document does not exist
            print("Error: Document does not exist with ID \(uniqueItemId)")
            completion()
        }
    }
}

