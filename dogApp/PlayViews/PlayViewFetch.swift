//
//  PlayViewFetch.swift
//  dogApp
//
//  Created by Kaspars Jelaiskis on 30/08/2023.
//

import SwiftUI

struct PlayViewFetch: View {
    
    @Environment(\.presentationMode) var presentationMode
    var bgColor = Color(red: 250.0/255.0, green: 250.0/255.0, blue: 250.0/255.0)
    @AppStorage("isFetchFave") var isFetchFave = false
    @StateObject var favoriteItems = FavoriteItems()

    var body: some View {
        
        ZStack(alignment: .topTrailing) {
            
            bgColor.ignoresSafeArea()
            
            HStack {
                FavoriteButton(isFavorite: $isFetchFave)
             
                Spacer()
                
                CloseSheetButton {
                    presentationMode.wrappedValue.dismiss()
            
                }
            }
            .zIndex(3)
            
            
            VStack(alignment: .leading, spacing: 16) {
                
                Image("Fetch")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding([.leading, .trailing], 16)
                
                Text("Fetch")
                    .font(.custom("SignikaNegative-SemiBold", size: 24))
                    .padding(.leading, 16)
              
                
               
                VStack(alignment: .leading) {
                    Text("• Start with a favorite toy or ball. \n \n • Toss the toy a short distance. \n \n • Encourage your dog to go after it by saying \"Fetch\" or using their name. \n \n • When they retrieve the toy, praise them and offer a treat. ")
                        .font(.custom("Poppins-Regular", size: 16))
                }
                .padding([.leading, .trailing], 16)

                Spacer()
            }
        }
       
    }
}

struct PlayViewFetch_Previews: PreviewProvider {
    static var previews: some View {
        PlayViewFetch()
    }
}
