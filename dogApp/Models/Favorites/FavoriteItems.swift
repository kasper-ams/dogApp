//
//  FavoriteItems.swift
//  dogApp
//
//  Created by Kaspars Jelaiskis on 10/10/2023.
//

import Foundation
import SwiftUI

class FavoriteItems: ObservableObject {
    
    @Published var items: [Item] = []
    @Published var favoriteItems: [ItemStructure] = []

    
    
    func addItem(_ item: Item) {
           items.append(item)
        objectWillChange.send()

       }
    
    func removeItem(_ item: Item) {
           if let index = items.firstIndex(where: { $0.id == item.id }) {
               items.remove(at: index)
               // Trigger a view update
               objectWillChange.send()
           }
       }
    

}

//     func toggleFavorite(_ item: Item) {
//           if items.contains(item) {
//               // Remove the item from favorites
//               items.removeAll { $0.id == item.id }
//           } else {
//               // Add the item to favorites
//               items.append(item)
//           }
//       }
    



