//
//  ListViewFavorites.swift
//  dogApp
//
//  Created by Kaspars Jelaiskis on 11/10/2023.
//

import SwiftUI
import Firebase
import FirebaseAuth

struct ListViewFavorites: View {
    let bgColor = Color(red: 250.0/255.0, green: 250.0/255.0, blue: 250.0/255.0)
    
    @EnvironmentObject private var authStateManager: AuthStateManager
    @ObservedObject var viewModel = ProfileViewModel()
    @StateObject private var favoriteViewModel = FavoriteViewModel()
    
    
    @State private var selectedItem: FavoriteItemData? = nil
    @State private var isPresentingSheet = false
    @State private var refreshView = false
    
    
    var body: some View {
        NavigationView {
            ZStack {
                bgColor.ignoresSafeArea()
                
                ScrollView {
                    
                    VStack(alignment: .leading) {
                        
                        VStack(alignment: .leading) {
                            Text("Favorites")
                                .font(.custom("SignikaNegative-SemiBold", size: 24))
                                .padding(.top, 24)
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }
                            .frame(maxWidth: .infinity)
                
                            if let user = Auth.auth().currentUser {
                                if favoriteViewModel.userFavoriteItems.isEmpty {
                                    Text("You haven't picked any favorites yet.")
                                        .font(.custom("Poppins-Regular", size: 16))
                                        .foregroundColor(.gray)
                                        .padding(.top, 24)
                                } else {
                                    VStack(alignment: .leading) {
                                        ForEach(favoriteViewModel.userFavoriteItems, id: \.id.self) { item in
                                            ItemCellViewBuilder(itemId: item.id)
                                        }
                                    }
                                }
                            } else {
                                Text("Please sign in to view favorites.")
                                    .font(.custom("Poppins-Regular", size: 16))
                                    .foregroundColor(.gray)
                                    .padding(.top, 24)
                                    .sheet(isPresented: $isPresentingSheet) {
                                       
                                    }
                                Spacer()
                            }
                    }
                    .padding()
                }
            }
            
            
        }
        .onAppear {
            Task {
                do {
                    let authDataResult = try AuthenticationManager.shared.getAuthenticatedUser()
                    
                } catch {
                    print("Error")
                }
            }
        }


        
        .navigationViewStyle(StackNavigationViewStyle())
        
        .onFirstAppear {
            favoriteViewModel.addListenerForFavorites()
        }
        
    }
}



#Preview {
    ListViewFavorites()
}



//        .onAppear {
//            Task {
//                refreshView.toggle()
//                try await viewModel.loadCurrentUser()
//            }
//        }


//        .onChange(of: authStateManager.isSignedIn) { _ in
//                    refreshView.toggle()
//                }
//                .task {
//                    try? await viewModel.loadCurrentUser()
//                }
