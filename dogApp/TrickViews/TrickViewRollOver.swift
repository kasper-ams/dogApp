//
//  TrickViewFetch.swift
//  dogApp
//
//  Created by Kaspars Jelaiskis on 30/08/2023.
//

import SwiftUI

struct TrickViewRollOver: View {
    @Environment(\.presentationMode) var presentationMode
    @AppStorage("isRollOverFave") var isRollOverFave = false
    @StateObject var favoriteItems = FavoriteItems()
    
    var bgColor = Color(red: 250.0/255.0, green: 250.0/255.0, blue: 250.0/255.0)
    var body: some View {
        
        ZStack(alignment: .topTrailing) {
            bgColor.ignoresSafeArea()
            
            HStack {
                FavoriteButton(isFavorite: $isRollOverFave)
             
                Spacer()
                
                CloseSheetButton {
                    presentationMode.wrappedValue.dismiss()
            
                }
            }
            .zIndex(3)
            
            VStack(alignment: .leading, spacing: 16) {
                
                Image("RollOver")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding([.leading, .trailing], 16)
                
                Text("Roll over")
                    .font(.custom("SignikaNegative-SemiBold", size: 24))
                    .padding(.leading, 16)
                
                VStack(alignment: .leading) {
                    Text("• Ask your dog to lie down. \n \n • Hold a treat close to their nose and move it in a circular motion, leading them to roll over. \n \n •  As they roll over, say \"Roll over\" and reward them with the treat.")
                        .font(.custom("Poppins-Regular", size: 16))
                }
                .padding([.leading, .trailing], 16)
                
                Spacer()
            }
        }    }
}

struct TrickViewFetch_Previews: PreviewProvider {
    static var previews: some View {
        TrickViewRollOver()
    }
}
