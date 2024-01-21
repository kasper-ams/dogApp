//
//  ItemsManager.swift
//  dogApp
//
//  Created by Kaspars Jelaiskis on 30/12/2023.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

final class ItemsManager {
    
    static let shared = ItemsManager()
    private init() { }
    
    private let itemsCollection = Firestore.firestore().collection("items")
    
    private func itemDocument(itemId: String) -> DocumentReference {
        itemsCollection.document(itemId)
    }
    
    func uploadItem(item: ItemStructure) async throws {
        try itemDocument(itemId: String(item.id)).setData(from: item, merge: false)
    }

    func getItem(itemId: String) async throws -> ItemStructure {
        try await itemDocument(itemId: itemId).getDocument(as: ItemStructure.self)
    }
    
    private func getAllItemsQuery() -> Query {
        itemsCollection
    }
    func getAllItems(count: Int, lastDocument: DocumentSnapshot?) async throws -> (products: [ItemStructure], lastDocument: DocumentSnapshot?) {
        var query: Query = getAllItemsQuery()
        
        return try await query
            .startOptionally(afterDocument: lastDocument)
            .getDocumentsWithSnapshot(as: ItemStructure.self)
    }
    
    
}
