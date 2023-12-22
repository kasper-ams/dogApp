//
//  TrickViewSpin.swift
//  dogApp
//
//  Created by Kaspars Jelaiskis on 30/09/2023.
//

import SwiftUI

struct TrickViewSpin: View {
    @Environment(\.presentationMode) var presentationMode
    var bgColor = Color(red: 250.0/255.0, green: 250.0/255.0, blue: 250.0/255.0)
    @AppStorage("isSpinFave") var isSpinFave = false
    @StateObject var favoriteItems = FavoriteItems()
    
    var body: some View {
        
        ZStack(alignment: .topTrailing) {
            
            bgColor.ignoresSafeArea()
            
            HStack {
                FavoriteButton(isFavorite: $isSpinFave)
             
                Spacer()
                
                CloseSheetButton {
                    presentationMode.wrappedValue.dismiss()
            
                }
            }
            .zIndex(3)
            
            ScrollView {
                
                VStack(alignment: .leading, spacing: 16) {
                    
                    Image("Spin")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding([.leading, .trailing], 16)
                    
                    Text("Spin")
                        .font(.custom("SignikaNegative-SemiBold", size: 24))
                        .padding(.leading, 16)
                    
                    VStack(alignment: .leading, spacing: 16) {
                        
                        Text("• Stand in front of your dog and hold a treat near the nose. \n \n • Guide them in a circle with the treat. \n \n • Add a command like \"spin.\" \n \n • Reward and praise when they complete the spin. \n \n • Practice both clockwise and counterclockwise spins.")
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
    TrickViewSpin()
}
