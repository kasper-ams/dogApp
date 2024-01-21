//
//  FavoriteButton.swift
//  dogApp
//
//  Created by Kaspars Jelaiskis on 04/10/2023.
//

import SwiftUI
import Firebase
import FirebaseAuth


struct FavoriteButton: View {
    
//    let item: ItemStructure

    let itemId: Int
    let title: String
    let image: String
    
    @StateObject var favoriteItems = FavoriteItems()
    @StateObject private var viewModel = ItemViewModel()
//    @StateObject private var viewModel = ProfileViewModel()
    @StateObject private var authModel = AuthenticationViewModel.shared
    @StateObject private var favoriteViewModel = FavoriteViewModel()

    @Binding var isFavorite: Bool

    
    
    @State private var uniqueID: String?
    @State private var isSignInSheetPresented = false


    
    var body: some View {
        
        Button {
            
            if isFavorite == false {
                viewModel.addUserFavoriteItem(itemId: itemId)
                isFavorite = true
                print("Added to favorites with ID: \(itemId)")
            } else {
                let favoriteItemtId = String(itemId)
                favoriteViewModel.removeFromFavorites(favoriteItemtId: favoriteItemtId)
                isFavorite = false
                print("Removed item with ID \(itemId) from favorites")
            }

        } label: {
            Image(systemName: isFavorite ? "heart.fill" : "heart")
                .foregroundColor(isFavorite ? .red : .white)
                .padding(8)
        }
        .background(Color(red: 0, green: 0, blue: 0, opacity: 60/255))
        .clipShape(Circle())
        .padding(24)
        .zIndex(3)
//        .sheet(isPresented: $isSignInSheetPresented) {
//            // Present your sign-in sheet here
//            AuthenticationView()
//        }
//        .onReceive(authModel.$isUserSignedIn) { newValue in
//
//        }
        
    }
    
    
    
}

#Preview {
    FavoriteButton(itemId: 1,title: "ads", image: "",  isFavorite: .constant(true))
}
