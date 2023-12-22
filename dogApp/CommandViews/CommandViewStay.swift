//
//  CommandViewStay.swift
//  dogApp
//
//  Created by Kaspars Jelaiskis on 01/09/2023.
//

import SwiftUI

struct CommandViewStay: View {
    @Environment(\.presentationMode) var presentationMode
    var bgColor = Color(red: 250.0/255.0, green: 250.0/255.0, blue: 250.0/255.0)
    @AppStorage("isStayFave")  var isStayFave = false

    
    var body: some View {
        
        ZStack(alignment: .topTrailing) {
            bgColor.ignoresSafeArea()
            
            HStack {
                FavoriteButton(isFavorite: $isStayFave)
            
                Spacer()
                CloseSheetButton {
                    presentationMode.wrappedValue.dismiss()
                }
            }
            .zIndex(3)
            
            VStack(alignment: .leading, spacing: 16) {
                
                Image("Stay")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding([.leading, .trailing], 16)
                
                Text("Stay")
                    .font(.custom("SignikaNegative-SemiBold", size: 24))
                    .padding(.leading, 16)
                
                VStack(alignment: .leading) {
                    Text("• Ask your dog to sit or lie down. \n \n • Hold your palm out towards them, like a stop sign. \n \n • Take a step back, and if they remain in place, say \"Stay\" and reward them with a treat. \n \n • Gradually increase the distance and duration over time.")
                        .font(.custom("Poppins-Regular", size: 16))
                }
                .padding([.leading, .trailing], 16)

                
                Spacer()
            }
        }
       
    }
}

struct CommandViewStay_Previews: PreviewProvider {
    static var previews: some View {
        CommandViewStay()
    }
}
