//
//  ListViewFavorites.swift
//  dogApp
//
//  Created by Kaspars Jelaiskis on 11/10/2023.
//

import SwiftUI


struct ListViewFavorites: View {
    let bgColor = Color(red: 250.0/255.0, green: 250.0/255.0, blue: 250.0/255.0)
    @ObservedObject var items = Items()
    
    @State private var selectedItem: Item? = nil
   
    
    @AppStorage("isSitFave") var isSitFave = false
    @AppStorage("isStayFave")  var isStayFave = false
    @AppStorage("isLieDownFave") private var isLieDownFave = false
    @AppStorage("isLeaveItFave") var isLeaveItFave = false
    @AppStorage("isRecallFave") private var isRecallFave = false
    @AppStorage("isPlaceFave") private var isPlaceFave = false
    @AppStorage("isHushFave") private var isHushFave = false
    @AppStorage("isEyeContactFave") private var isEyeContactFave = false
    
    @AppStorage("isFetchFave") var isFetchFave = false
    @AppStorage("isHideFave") var isHideFave = false
    @AppStorage("isTugFave") var isTugFave = false
    @AppStorage("isFrisbeeFave") var isFrisbeeFave = false
    @AppStorage("isTreasureHuntFave") var isTreasureHuntFave = false
    @AppStorage("isTunnelFave") var isTunnelFave = false
    @AppStorage("isTreatChallengeFave") var isTreatChallengeFave = false
    @AppStorage("isVolleyFave") var isVolleyFave = false
    
    @AppStorage("isRollOverFave") var isRollOverFave = false
    @AppStorage("isHighFiveFave") var isHighFiveFave = false
    @AppStorage("isHJumpFave") var isHJumpFave = false
    @AppStorage("isPlayDeadFave") var isPlayDeadFave = false
    @AppStorage("isBarkFave") var isBarkFave = false
    @AppStorage("isPeekFave") var isPeekFave = false
    @AppStorage("isCrawlFave") var isCrawlFave = false
    @AppStorage("isSpinFave") var isSpinFave = false
    
    private func areAllFavoritesEmpty() -> Bool {
           // Check all @AppStorage variables for emptiness.
           return !isSitFave &&
                  !isStayFave &&
                  !isLieDownFave &&
                  !isLeaveItFave &&
                  !isRecallFave &&
                  !isPlaceFave &&
                  !isHushFave &&
                  !isEyeContactFave &&
                  !isFetchFave &&
                  !isHideFave &&
                  !isTugFave &&
                  !isFrisbeeFave &&
                  !isTreasureHuntFave &&
                  !isTunnelFave &&
                  !isTreatChallengeFave &&
                  !isVolleyFave &&
                  !isRollOverFave &&
                  !isHighFiveFave &&
                  !isHJumpFave &&
                  !isPlayDeadFave &&
                  !isBarkFave &&
                  !isPeekFave &&
                  !isCrawlFave &&
                  !isSpinFave
       }
    
    var body: some View {
        
        NavigationView {
            
            ZStack {
                bgColor.ignoresSafeArea()
                
                ScrollView {
                    VStack(alignment: .leading) {
                        Text("Favorites")
                            .font(.custom("SignikaNegative-SemiBold", size: 24))
                            .padding(.top, 24)
                            .padding(.leading, 16)
                        
                        
                        HStack {
                            VStack(alignment: .leading, spacing: 16) {
                                if areAllFavoritesEmpty() {
                                    Text("You haven't picked any favorites yet!")
                                        .font(.custom("Poppins-Regular", size: 16))
                                    
                                } else {
                                    //commands
                                    if isSitFave {
                                        ForEach(items.commands.prefix(1), id: \.text) { item in
                                            Button(action: {
                                                selectedItem = item
                                            }) {
                                                FavoriteItem(text: item.text, image: item.image)
                                            }
                                        }
                                    }
                                    if isStayFave {
                                        let index = 1
                                        if index < items.commands.count {
                                            let item = items.commands[index]
                                            
                                            ForEach([item], id: \.text) { item in
                                                Button(action: {
                                                    selectedItem = item
                                                }) {
                                                    FavoriteItem(text: item.text, image: item.image)
                                                }
                                            }
                                        }
                                    }
                                    if isLieDownFave {
                                        let index = 2
                                        if index < items.commands.count {
                                            let item = items.commands[index]
                                            
                                            ForEach([item], id: \.text) { item in
                                                Button(action: {
                                                    selectedItem = item
                                                }) {
                                                    FavoriteItem(text: item.text, image: item.image)
                                                }
                                            }
                                        }
                                    }
                                    if isLeaveItFave {
                                        let index = 4
                                        if index < items.commands.count {
                                            let item = items.commands[index]
                                            
                                            ForEach([item], id: \.text) { item in
                                                Button(action: {
                                                    selectedItem = item
                                                }) {
                                                    FavoriteItem(text: item.text, image: item.image)
                                                }
                                            }
                                        }
                                    }
                                    if isRecallFave {
                                        let index = 3
                                        if index < items.commands.count {
                                            let item = items.commands[index]
                                            
                                            ForEach([item], id: \.text) { item in
                                                Button(action: {
                                                    selectedItem = item
                                                }) {
                                                    FavoriteItem(text: item.text, image: item.image)
                                                }
                                            }
                                        }
                                    }
                                    if isPlaceFave {
                                        let index = 5
                                        if index < items.commands.count {
                                            let item = items.commands[index]
                                            
                                            ForEach([item], id: \.text) { item in
                                                Button(action: {
                                                    selectedItem = item
                                                }) {
                                                    FavoriteItem(text: item.text, image: item.image)
                                                }
                                            }
                                        }
                                    }
                                    if isHushFave {
                                        let index = 6
                                        if index < items.commands.count {
                                            let item = items.commands[index]
                                            
                                            ForEach([item], id: \.text) { item in
                                                Button(action: {
                                                    selectedItem = item
                                                }) {
                                                    FavoriteItem(text: item.text, image: item.image)
                                                }
                                            }
                                        }
                                    }
                                    if isEyeContactFave {
                                        let index = 7
                                        if index < items.commands.count {
                                            let item = items.commands[index]
                                            
                                            ForEach([item], id: \.text) { item in
                                                Button(action: {
                                                    selectedItem = item
                                                }) {
                                                    FavoriteItem(text: item.text, image: item.image)
                                                }
                                            }
                                        }
                                    }
                                    //playviews
                                    if isFetchFave {
                                        let index = 0
                                        if index < items.games.count {
                                            let item = items.games[index]
                                            
                                            ForEach([item], id: \.text) { item in
                                                Button(action: {
                                                    selectedItem = item
                                                }) {
                                                    FavoriteItem(text: item.text, image: item.image)
                                                }
                                            }
                                        }
                                    }
                                    if isHideFave {
                                        let index = 1
                                        if index < items.games.count {
                                            let item = items.games[index]
                                            
                                            ForEach([item], id: \.text) { item in
                                                Button(action: {
                                                    selectedItem = item
                                                }) {
                                                    FavoriteItem(text: item.text, image: item.image)
                                                }
                                            }
                                        }
                                    }
                                    if isTugFave {
                                        let index = 2
                                        if index < items.games.count {
                                            let item = items.games[index]
                                            
                                            ForEach([item], id: \.text) { item in
                                                Button(action: {
                                                    selectedItem = item
                                                }) {
                                                    FavoriteItem(text: item.text, image: item.image)
                                                }
                                            }
                                        }
                                    }
                                    if isFrisbeeFave {
                                        let index = 3
                                        if index < items.games.count {
                                            let item = items.games[index]
                                            
                                            ForEach([item], id: \.text) { item in
                                                Button(action: {
                                                    selectedItem = item
                                                }) {
                                                    FavoriteItem(text: item.text, image: item.image)
                                                }
                                            }
                                        }
                                    }
                                    if isTreasureHuntFave {
                                        let index = 4
                                        if index < items.games.count {
                                            let item = items.games[index]
                                            
                                            ForEach([item], id: \.text) { item in
                                                Button(action: {
                                                    selectedItem = item
                                                }) {
                                                    FavoriteItem(text: item.text, image: item.image)
                                                }
                                            }
                                        }
                                    }
                                    if isTunnelFave {
                                        let index = 5
                                        if index < items.games.count {
                                            let item = items.games[index]
                                            
                                            ForEach([item], id: \.text) { item in
                                                Button(action: {
                                                    selectedItem = item
                                                }) {
                                                    FavoriteItem(text: item.text, image: item.image)
                                                }
                                            }
                                        }
                                    }
                                    if isTreatChallengeFave {
                                        let index = 6
                                        if index < items.games.count {
                                            let item = items.games[index]
                                            
                                            ForEach([item], id: \.text) { item in
                                                Button(action: {
                                                    selectedItem = item
                                                }) {
                                                    FavoriteItem(text: item.text, image: item.image)
                                                }
                                            }
                                        }
                                    }
                                    if isVolleyFave {
                                        let index = 7
                                        if index < items.games.count {
                                            let item = items.games[index]
                                            
                                            ForEach([item], id: \.text) { item in
                                                Button(action: {
                                                    selectedItem = item
                                                }) {
                                                    FavoriteItem(text: item.text, image: item.image)
                                                }
                                            }
                                        }
                                    }
                                    //tricks
                                    if isRollOverFave {
                                        let index = 0
                                        if index < items.tricks.count {
                                            let item = items.tricks[index]
                                            
                                            ForEach([item], id: \.text) { item in
                                                Button(action: {
                                                    selectedItem = item
                                                }) {
                                                    FavoriteItem(text: item.text, image: item.image)
                                                }
                                            }
                                        }
                                    }
                                    if isHighFiveFave {
                                        let index = 1
                                        if index < items.tricks.count {
                                            let item = items.tricks[index]
                                            
                                            ForEach([item], id: \.text) { item in
                                                Button(action: {
                                                    selectedItem = item
                                                }) {
                                                    FavoriteItem(text: item.text, image: item.image)
                                                }
                                            }
                                        }
                                    }
                                    if isHJumpFave {
                                        let index = 2
                                        if index < items.tricks.count {
                                            let item = items.tricks[index]
                                            
                                            ForEach([item], id: \.text) { item in
                                                Button(action: {
                                                    selectedItem = item
                                                }) {
                                                    FavoriteItem(text: item.text, image: item.image)
                                                }
                                            }
                                        }
                                    }
                                    if isPlayDeadFave {
                                        let index = 3
                                        if index < items.tricks.count {
                                            let item = items.tricks[index]
                                            
                                            ForEach([item], id: \.text) { item in
                                                Button(action: {
                                                    selectedItem = item
                                                }) {
                                                    FavoriteItem(text: item.text, image: item.image)
                                                }
                                            }
                                        }
                                    }
                                    if isBarkFave {
                                        let index = 4
                                        if index < items.tricks.count {
                                            let item = items.tricks[index]
                                            
                                            ForEach([item], id: \.text) { item in
                                                Button(action: {
                                                    selectedItem = item
                                                }) {
                                                    FavoriteItem(text: item.text, image: item.image)
                                                }
                                            }
                                        }
                                    }
                                    if isPeekFave {
                                        let index = 5
                                        if index < items.tricks.count {
                                            let item = items.tricks[index]
                                            
                                            ForEach([item], id: \.text) { item in
                                                Button(action: {
                                                    selectedItem = item
                                                }) {
                                                    FavoriteItem(text: item.text, image: item.image)
                                                }
                                            }
                                        }
                                    }
                                    if isCrawlFave {
                                        let index = 6
                                        if index < items.tricks.count {
                                            let item = items.tricks[index]
                                            
                                            ForEach([item], id: \.text) { item in
                                                Button(action: {
                                                    selectedItem = item
                                                }) {
                                                    FavoriteItem(text: item.text, image: item.image)
                                                }
                                            }
                                        }
                                    }
                                    if isSpinFave {
                                        let index = 7
                                        if index < items.tricks.count {
                                            let item = items.tricks[index]
                                            
                                            ForEach([item], id: \.text) { item in
                                                Button(action: {
                                                    selectedItem = item
                                                }) {
                                                    FavoriteItem(text: item.text, image: item.image)
                                                }
                                            }
                                        }
                                    }
                                    
                                }
                            }
                            
                            Spacer()
                        }
                        .padding(16)
                        
                    }
                    
                }
                
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
        
        .sheet(item: $selectedItem) { item in
            item.sheet()
        }
    }
   
    }
    
    #Preview {
        ListViewFavorites()
    }
