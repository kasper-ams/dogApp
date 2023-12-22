//
//  PlayViewTug.swift
//  dogApp
//
//  Created by Kaspars Jelaiskis on 02/09/2023.
//

import SwiftUI

struct PlayViewTug: View {
    @Environment(\.presentationMode) var presentationMode
    var bgColor = Color(red: 250.0/255.0, green: 250.0/255.0, blue: 250.0/255.0)
    @AppStorage("isTugFave") var isTugFave = false
    @StateObject var favoriteItems = FavoriteItems()
    
    var body: some View {
        
        ZStack(alignment: .topTrailing) {
            bgColor.ignoresSafeArea()
            
            HStack {
                FavoriteButton(isFavorite: $isTugFave)
             
                Spacer()
                
                CloseSheetButton {
                    presentationMode.wrappedValue.dismiss()
            
                }
            }
            .zIndex(3)

            
            
            VStack(alignment: .leading, spacing: 16) {
               
                Image("Tug")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding([.leading, .trailing], 16)
                
                Text("Tug of war")
                    .font(.custom("SignikaNegative-SemiBold", size: 24))
                    .padding(.leading, 16)
                
                VStack(alignment: .leading) {
                    Text("Tug of war is a super fun game for pups who love a bit of roughhousing! \n \nGrab a strong rope or a special tug toy just for dogs, and let's get this paw-some party started! \n \nBut first, let's set some basic rules, like a cool command to kick off the game and another to call it quits. This way, your furry friend knows when it's time to get their tug on. \n \nOh, and don't forget, keep an eye on the action to make sure everyone's having a blast safely. We wouldn't want things to get too rowdy! ")
                        .font(.custom("Poppins-Regular", size: 16))
                   
                }
                .padding([.leading, .trailing], 16)

                Spacer()
            }
        }
    }
}

struct PlayViewTug_Previews: PreviewProvider {
    static var previews: some View {
        PlayViewTug()
    }
}
