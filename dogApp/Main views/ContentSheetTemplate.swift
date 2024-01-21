//
//  CommandViewSit2.swift
//  dogApp
//
//  Created by Kaspars Jelaiskis on 02/01/2024.
//

import SwiftUI
import Combine
import Firebase


struct ContentSheetTemplate: View {
    @Environment(\.presentationMode) var presentationMode
    let bgColor = Color(red: 250.0/255.0, green: 250.0/255.0, blue: 250.0/255.0)
    let item: ItemStructure
    @StateObject var favoriteItems = FavoriteItems()
    @StateObject private var viewModel = ItemViewModel()
    @StateObject private var favoriteViewModel = FavoriteViewModel()
    @State private var isFavorite: Bool = false
    @State private var cancellables: Set<AnyCancellable> = []
    
    var isItemInFavorites: Bool {
        favoriteItems.favoriteItems.contains(where: { $0.id == item.id })
    }


    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            bgColor.ignoresSafeArea()
            
            HStack {
                
                //show only if user is authenticated
                if let user = Auth.auth().currentUser {
                    Button {
                        
                        if isFavorite == false {
                            viewModel.addUserFavoriteItem(itemId: item.id)
                            isFavorite = true
                            print("Added to favorites with ID: \(item.id)")
                        } else {
                            let favoriteItemtId = String(item.id)
                            favoriteViewModel.removeFromFavorites(favoriteItemtId: favoriteItemtId)
                            isFavorite = false
                            print("Removed item with ID \(item.id) from favorites")
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
                }
                
                Spacer()
                
                CloseSheetButton {
                    presentationMode.wrappedValue.dismiss()
            
                }
            }
            .zIndex(3)
            
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    
                    Image(item.image ?? " ")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                    Text(item.title ?? " ")
                        .font(.custom("SignikaNegative-SemiBold", size: 24))
                    if let summary = item.summary {
                        ZStack(alignment: .leading) {
                            RoundedRectangle(cornerRadius: 4)
                                .fill(.thickMaterial)
                            
                            Text(summary)
                                .font(.custom("Poppins-Regular", size: 14))
                                .foregroundColor(.gray)
                                .padding()
                        }
                    }
                    Text(item.description ?? " ")
                    Spacer()
                    

              
//                    Button("Fetch status") {
//                        // On button tap, check if the current item is in favorites
//                        isFavorite = favoriteViewModel.userFavoriteItems.contains { $0.itemtId == item.id }
//                        print("Is item in favorites: \(isFavorite)")
//                    }
                    
                }
                .padding([.leading,.trailing], 16)
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                    isFavorite = favoriteViewModel.userFavoriteItems.contains { $0.itemtId == item.id }
                    print("Is item in favorites: \(isFavorite)")
                }
            }
            .onFirstAppear {
                favoriteViewModel.addListenerForFavorites()
            }
        }
    }
}

#Preview {
    ContentSheetTemplate(item: ItemStructure(id: 1, title: "Title", description: "Description", summary: "Summary", image: "Sit"))
}
