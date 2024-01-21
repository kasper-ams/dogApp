//
//  ItemViewModel.swift
//  dogApp
//
//  Created by Kaspars Jelaiskis on 30/12/2023.
//

import Foundation
import SwiftUI
import FirebaseFirestore

@MainActor
final class ItemViewModel: ObservableObject {
    
    @Published private(set) var items: [ItemStructure] = []
    private var lastDocument: DocumentSnapshot? = nil
    

    
    func getItems() {
        Task {
            let (newItems, lastDocument) = try await ItemsManager.shared.getAllItems(count: 50, lastDocument: lastDocument)
            
            self.items.append(contentsOf: newItems)
            if let lastDocument {
                self.lastDocument = lastDocument
            }
        }
    }
    
    func addUserFavoriteItem(itemId: Int) {
        Task {
            let authDataResult = try AuthenticationManager.shared.getAuthenticatedUser()
            try? await UserManager.shared.addUserFavoriteItem(userId: authDataResult.uid, itemtId: itemId)
        }
    }
    
   
    
    func uploadItemsToFirebase() {
        Task {
            do {
                let items = ItemArray(items: ItemDatabase.items, total: ItemDatabase.items.count, skip: 0, limit: 10)
                let itemArray = items.items
                
                for item in itemArray {
                    try? await ItemsManager.shared.uploadItem(item: item)
                }
                print("Success")
                print(items.items.count)
            } catch {
                print(error)
            }
        }
    }

}
