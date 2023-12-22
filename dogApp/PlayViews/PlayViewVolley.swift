//
//  PlayViewVolley.swift
//  dogApp
//
//  Created by Kaspars Jelaiskis on 01/10/2023.
//

import SwiftUI

struct PlayViewVolley: View {
    @Environment(\.presentationMode) var presentationMode
    var bgColor = Color(red: 250.0/255.0, green: 250.0/255.0, blue: 250.0/255.0)
    @AppStorage("isVolleyFave") var isVolleyFave = false
    @StateObject var favoriteItems = FavoriteItems()
    
    var body: some View {
        
        ZStack(alignment: .topTrailing) {
            
            bgColor.ignoresSafeArea()
            HStack {
                FavoriteButton(isFavorite: $isVolleyFave)
             
                Spacer()
                
                CloseSheetButton {
                    presentationMode.wrappedValue.dismiss()
            
                }
            }
            .zIndex(3)
            
            ScrollView {
                
                VStack(alignment: .leading, spacing: 16) {
                    
                    Image("Volley")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding([.leading, .trailing], 16)
                    
                    Text("Volley")
                        .font(.custom("SignikaNegative-SemiBold", size: 24))
                        .padding(.leading, 16)
                    
                    VStack(alignment: .leading, spacing: 16) {
                        
                        Text("The goal is to have a great time with your dog while encouraging them to fetch and return the ball to you, creating a playful, volley-like experience.")
                        
                        Text("• Select a suitable ball or toy for your dog. It should be soft and lightweight to avoid causing any harm if your dog accidentally gets hit or trips while chasing it.\n \n • Begin by tossing the ball gently to your dog. Use an underhand motion to create a soft lob. Encourage your dog to retrieve the ball by saying a cue like \"fetch\" or \"get it.\"\n \n • When your dog picks up the ball, enthusiastically call them back to you. You can use phrase like \"bring it\". Offer positive reinforcement, such as praise or treats, when they return the ball to you.\n \n • Continue to toss the ball to your dog, encouraging them to retrieve it and bring it back to you. Keep the game light-hearted and fun.\n\nPlaying volley with your dog is a great way to exercise, bond, and have fun together. Remember to always prioritize your dog's safety and enjoyment during playtime.")
                            .font(.custom("Poppins-Regular", size: 16))
                    }
                    
                    .padding([.leading, .trailing], 16)
                    
                    Spacer()
                }
            }
        }
    }
}

#Preview {
    PlayViewVolley()
}
