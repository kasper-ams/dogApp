//
//  FavoriteItem.swift
//  dogApp
//
//  Created by Kaspars Jelaiskis on 17/10/2023.
//

import SwiftUI

struct FavoriteItem: View {
    let favoriteItemData: FavoriteItemData
    
    @State private var isPresentingSheet = false

    var body: some View {
        HStack(spacing: 16) {
            Image(favoriteItemData.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 72, height: 72)
                .mask(Circle())
            
            Text(favoriteItemData.text)
                .font(.custom("SignikaNegative-Regular", size: 18))
        }
        .onTapGesture {
            isPresentingSheet.toggle()
        }
        .sheet(isPresented: $isPresentingSheet) {
            // Pass the complete item data to ContentSheetTemplate
            ContentSheetTemplate(item: ItemStructure(
                id: favoriteItemData.id,
                title: favoriteItemData.text,
                description: favoriteItemData.description,
                summary: favoriteItemData.summary,
                image: favoriteItemData.image
            ))
        }
    }
}

#Preview {
    FavoriteItem(favoriteItemData: FavoriteItemData(text: "Sit", image: "Sit", id: 1, description: "", summary: ""))
}
