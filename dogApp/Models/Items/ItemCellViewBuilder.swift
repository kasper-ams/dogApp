//
//  ItemCellViewBuilder.swift
//  dogApp
//
//  Created by Kaspars Jelaiskis on 09/01/2024.
//

import SwiftUI

struct ItemCellViewBuilder: View {
    
    let itemId: String
    @State private var favoriteItemData: FavoriteItemData? = nil

    var body: some View {
        ZStack {
            if let favoriteItemData = favoriteItemData {
                FavoriteItem(favoriteItemData: favoriteItemData)
            }
        }
        .task {
            if let item = try? await ItemsManager.shared.getItem(itemId: itemId) {
                self.favoriteItemData = FavoriteItemData(text: item.title ?? "", image: item.image ?? "", id: item.id, description: item.description, summary: item.summary)
            }
        }
    }
}

#Preview {
    ItemCellViewBuilder(itemId: "3")
}
