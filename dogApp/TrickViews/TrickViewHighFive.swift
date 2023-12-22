//
//  TrickViewHighFive.swift
//  dogApp
//
//  Created by Kaspars Jelaiskis on 01/09/2023.
//

import SwiftUI

struct TrickViewHighFive: View {
    @Environment(\.presentationMode) var presentationMode
    var bgColor = Color(red: 250.0/255.0, green: 250.0/255.0, blue: 250.0/255.0)
    
    @AppStorage("isHighFiveFave") var isHighFiveFave = false
    @StateObject var favoriteItems = FavoriteItems()

    var body: some View {
        ZStack(alignment: .topTrailing) {
            bgColor.ignoresSafeArea()
            
            HStack {
                FavoriteButton(isFavorite: $isHighFiveFave)
             
                Spacer()
                
                CloseSheetButton {
                    presentationMode.wrappedValue.dismiss()
            
                }
            }
            .zIndex(3)
            VStack(alignment: .leading, spacing: 16) {
                
                Image("HighFive")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding([.leading, .trailing], 16)
                
                Text("High five")
                    .font(.custom("SignikaNegative-SemiBold", size: 24))
                    .padding(.leading, 16)
                
                VStack(alignment: .leading) {
                    Text("• Start with your dog in a sitting position. \nHold a treat in your hand and raise it slightly above their head. Say \"High five\" and gently tap one of their front paws. \n \n • When they raise their paw to reach for the treat, give it to them and praise them.")
                        .font(.custom("Poppins-Regular", size: 16))
                }
                .padding([.leading, .trailing], 16)

                Spacer()
            }
        }
    }
}

struct TrickViewHighFive_Previews: PreviewProvider {
    static var previews: some View {
        TrickViewHighFive()
    }
}
