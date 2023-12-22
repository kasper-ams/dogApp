//
//  CommandViewSit.swift
//  dogApp
//
//  Created by Kaspars Jelaiskis on 30/08/2023.
//

import SwiftUI

struct CommandViewSit: View {
    @Environment(\.presentationMode) var presentationMode
    let bgColor = Color(red: 250.0/255.0, green: 250.0/255.0, blue: 250.0/255.0)
    
    @AppStorage("isSitFave") var isSitFave = false
    @StateObject var favoriteItems = FavoriteItems()

    
    var body: some View {
        
        ZStack(alignment: .topTrailing) {
            bgColor.ignoresSafeArea()
            //this could be scrolled together with the sheet
            HStack {
                FavoriteButton(isFavorite: $isSitFave)
             
                Spacer()
                
                CloseSheetButton {
                    presentationMode.wrappedValue.dismiss()
            
                }
            }
            .zIndex(3)
            
            
            VStack(alignment: .leading, spacing: 16) {
                
                Image("Sit")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding([.leading, .trailing], 16)
                
                Text("Sit")
                    .font(.custom("SignikaNegative-SemiBold", size: 24))
                    .padding(.leading, 16)
                
                VStack(alignment: .leading) {
                    Text("• Hold a treat close to your dog's nose. Move your hand upwards, causing their head to follow the treat. \n \n  • As their head moves up, their bottom will naturally lower into a sitting position. \n \n • Once they are sitting, say \"Sit\" and give them the treat. ")
                        .font(.custom("Poppins-Regular", size: 16))
                    
                }
                
                .padding([.leading, .trailing], 16)
                
                Spacer()
            }
            
        }
    }
}

struct CommandViewSit_Previews: PreviewProvider {
    static var previews: some View {
        CommandViewSit()
    }
}
