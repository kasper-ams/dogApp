//
//  TrickViewPeek.swift
//  dogApp
//
//  Created by Kaspars Jelaiskis on 30/09/2023.
//

import SwiftUI

struct TrickViewPeek: View {
    @Environment(\.presentationMode) var presentationMode
    var bgColor = Color(red: 250.0/255.0, green: 250.0/255.0, blue: 250.0/255.0)
    @AppStorage("isPeekFave") var isPeekFave = false
    @StateObject var favoriteItems = FavoriteItems()
    
    var body: some View {

        ZStack(alignment: .topTrailing) {
            bgColor.ignoresSafeArea()
            
            HStack {
                FavoriteButton(isFavorite: $isPeekFave)
             
                Spacer()
                
                CloseSheetButton {
                    presentationMode.wrappedValue.dismiss()
            
                }
            }
            .zIndex(3)
            
            ScrollView {
                
                VStack(alignment: .leading, spacing: 16) {
                    
                    Image("Peek")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding([.leading, .trailing], 16)
                    
                    Text("Peek")
                        .font(.custom("SignikaNegative-SemiBold", size: 24))
                        .padding(.leading, 16)
                    
                    VStack(alignment: .leading, spacing: 16) {
                        
                        Text("Want to impress your friends with your dog's adorable antics? Here's how to teach them to peek through the legs.")
                        
                        Text("• Start with your dog in front of you, and hold a treat or toy between your legs. \n \n • Pick a word like \"peek\" or \"through\" to signal the action. \n \n • Encourage your pup to reach for the treat or toy by gently moving it back and forth between your legs. \n \n • The moment they peek through, celebrate! Treats and enthusiastic praise are a must. \n \nPractice makes perfect, so keep at it until they nail the trick.")
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
    TrickViewPeek()
}
