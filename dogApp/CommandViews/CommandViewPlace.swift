//
//  CommandViewPlace.swift
//  dogApp
//
//  Created by Kaspars Jelaiskis on 29/09/2023.
//

import SwiftUI

struct CommandViewPlace: View {
    let bgColor = Color(red: 250.0/255.0, green: 250.0/255.0, blue: 250.0/255.0)
    @Environment(\.presentationMode) var presentationMode
    @AppStorage("isPlaceFave") private var isPlaceFave = false

    
    var body: some View {
        
        ZStack(alignment: .topTrailing) {
            
            bgColor.ignoresSafeArea()
            
            HStack {
                FavoriteButton(isFavorite: $isPlaceFave)
            
                Spacer()
                CloseSheetButton {
                    presentationMode.wrappedValue.dismiss()
                }
            }
            .zIndex(3)
            
            ScrollView {
                
                VStack(alignment: .leading, spacing: 16) {
                    
                    Image("Place")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding([.leading, .trailing], 16)
                    
                    Text("Place")
                        .font(.custom("SignikaNegative-SemiBold", size: 24))
                        .padding(.leading, 16)
                    
                    VStack(alignment: .leading, spacing: 16) {
                        
                        Text("Teaching your dog to \"go to place\" is a handy command that can make your life easier. Follow these steps.")
                        
                        Text("Select a Spot")
                            .font(.headline)
                        Text("Choose a comfy spot for your dog to stay, like a dog bed or a designated area on the floor.")
                            .font(.custom("Poppins-Regular", size: 16))
                        
                        Text("Get Treats and Clicker")
                            .font(.headline)
                        Text("You'll need treats and a clicker (optional) for positive reinforcement.")
                            .font(.custom("Poppins-Regular", size: 16))
                        
                        Text("Introduce the Command")
                            .font(.headline)
                        Text("Using a leash, stand by the chosen spot and say your command, like \"place\" or \"bed.\"")
                            .font(.custom("Poppins-Regular", size: 16))
                        
                        Text("Lure Your Dog")
                            .font(.headline)
                        Text("Use a treat to guide your dog onto the spot. Make sure they're fully on it before rewarding.")
                            .font(.custom("Poppins-Regular", size: 16))
                        Group {
                            Text("Reward and Praise")
                                .font(.headline)
                            
                            Text("Click (if using a clicker) and treat immediately. Offer verbal praise like \"Good job!\"")
                                .font(.custom("Poppins-Regular", size: 16))
                            
                            Text("Add Duration")
                                .font(.headline)
                            
                            Text("Start waiting a few seconds before rewarding to build patience.")
                                .font(.custom("Poppins-Regular", size: 16))
                            
                            
                        }
                    }
                    
                    .padding([.leading, .trailing], 16)
                    
                    Spacer()
                }
            }
        }
    }
}

struct CommandViewPlace_Previews: PreviewProvider {
    static var previews: some View {
        CommandViewPlace()
    }
}
