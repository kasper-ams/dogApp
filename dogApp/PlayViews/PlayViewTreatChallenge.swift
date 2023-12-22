//
//  PlayViewTreatChallenge.swift
//  dogApp
//
//  Created by Kaspars Jelaiskis on 01/10/2023.
//

import SwiftUI

struct PlayViewTreatChallenge: View {
    @Environment(\.presentationMode) var presentationMode
    var bgColor = Color(red: 250.0/255.0, green: 250.0/255.0, blue: 250.0/255.0)
    @AppStorage("isTreatChallengeFave") var isTreatChallengeFave = false
    @StateObject var favoriteItems = FavoriteItems()
    
    var body: some View {
        
        ZStack(alignment: .topTrailing) {
            
            bgColor.ignoresSafeArea()
            HStack {
                FavoriteButton(isFavorite: $isTreatChallengeFave)
             
                Spacer()
                
                CloseSheetButton {
                    presentationMode.wrappedValue.dismiss()
            
                }
            }
            .zIndex(3)
            
            ScrollView {
                
                VStack(alignment: .leading, spacing: 16) {
                    
                    Image("Cups")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding([.leading, .trailing], 16)
                    
                    Text("Treat challenge")
                        .font(.custom("SignikaNegative-SemiBold", size: 24))
                        .padding(.leading, 16)
                    
                    VStack(alignment: .leading, spacing: 16) {
                        
                        Text("This is an engaging way to keep their mind sharp and provide entertainment. In this game, your furry friend will learn to guess which cup hides the treat.")
                        
                        Text("• Arrange the three cups upside down in a row on the floor. \n \n • Allow your dog to observe as you place a treat under one of the cups. Ensure they see which cup you choose. \n \n • Use a specific command like \"Find it!\" to signal the start of the game. \n \n • Let your dog use their paws or nose to nudge the cups and discover which one hides the treat. They may need some time to figure it out, so be patient. \n \n • When your dog successfully uncovers the treat, celebrate their victory with joyful praise and, of course, the delicious reward.")
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
    PlayViewTreatChallenge()
}
