//
//  FavoriteButton.swift
//  dogApp
//
//  Created by Kaspars Jelaiskis on 04/10/2023.
//

import SwiftUI

struct FavoriteButton: View {
    
    @Binding var isFavorite: Bool
    
    
    var body: some View {
        
        Button(action: {
            isFavorite.toggle()
            print("Favorite State: \(isFavorite)")
               }) {
                   Image(systemName: isFavorite ? "heart.fill" : "heart")
                       .foregroundColor(isFavorite ? .red : .white)
                       .padding(8)
               }
               .background(Color(red: 0, green: 0, blue: 0, opacity: 60/255))
               .clipShape(Circle())
               .padding(24)
               .zIndex(3)
            }
    }

#Preview {
    FavoriteButton(isFavorite: .constant(false))
}
