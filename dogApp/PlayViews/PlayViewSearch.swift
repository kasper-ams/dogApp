//
//  PlayViewSearch.swift
//  dogApp
//
//  Created by Kaspars Jelaiskis on 17/09/2023.
//

import SwiftUI

struct PlayViewSearch: View {
    @Environment(\.presentationMode) var presentationMode
    var bgColor = Color(red: 250.0/255.0, green: 250.0/255.0, blue: 250.0/255.0)
    @AppStorage("isTreasureHuntFave") var isTreasureHuntFave = false
    @StateObject var favoriteItems = FavoriteItems()
    
    var body: some View {
        
        ZStack(alignment: .topTrailing) {
            
            bgColor.ignoresSafeArea()
            
            HStack {
                FavoriteButton(isFavorite: $isTreasureHuntFave)
             
                Spacer()
                
                CloseSheetButton {
                    presentationMode.wrappedValue.dismiss()
            
                }
            }
            .zIndex(3)
            
            ScrollView {
                
            VStack(alignment: .leading, spacing: 16) {
                
                Image("treasureHunt")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding([.leading, .trailing], 16)
                
                Text("Treasure hunt")
                    .font(.custom("SignikaNegative-SemiBold", size: 24))
                    .padding(.leading, 16)
                
                VStack(alignment: .leading, spacing: 16) {
                    
                    Group {
                        Text("Choose a Treasure")
                            .font(.headline)
                        
                        Text("Start with a treat or toy that your dog loves. This will be the \"treasure\" they're searching for.")
                            .font(.custom("Poppins-Regular", size: 16))
                        
                        Text("Show the Treasure")
                            .font(.headline)
                        
                        Text("Let your dog see the treat or toy, so they know what they're looking for. Make sure they're excited about it.")
                            .font(.custom("Poppins-Regular", size: 16))
                        
                        Text("Start Easy")
                            .font(.headline)
                        
                        Text("At first, hide the treasure somewhere easy for your dog to find, like behind a cushion or under a blanket.")
                            .font(.custom("Poppins-Regular", size: 16))
                        
                        Text("Give the Command")
                            .font(.headline)
                        
                        Text("Use a cue word like \"find it\" while your dog watches you hide the treasure.")
                            .font(.custom("Poppins-Regular", size: 16))
                        
                        Text("Encourage the Search")
                            .font(.headline)
                        
                        Text("Encourage your dog to search by pointing or showing interest in the hidden spot. You can even use your excited voice to say, \"Where's the treasure?\"")
                            .font(.custom("Poppins-Regular", size: 16))
                    }
                    
                    Text("Celebrate Success")
                        .font(.headline)
                    
                    Text("When your dog finds the treasure, celebrate! Praise them and give them the treat or toy as a reward.")
                        .font(.custom("Poppins-Regular", size: 16))
                    
                    Text("Make It Harder")
                        .font(.headline)
                    
                    Text("As your dog gets better at finding hidden treasures, make the game more challenging. Hide the treasure in different rooms or under more complex hiding spots.")
                        .font(.custom("Poppins-Regular", size: 16))
                    
                }
                .padding([.leading, .trailing], 16)
                
                Spacer()
            }
        }
    }    }
}

struct PlayViewSearch_Previews: PreviewProvider {
    static var previews: some View {
        PlayViewSearch()
    }
}
