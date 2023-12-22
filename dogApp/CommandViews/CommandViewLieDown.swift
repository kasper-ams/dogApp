//
//  CommandViewLieDown.swift
//  dogApp
//
//  Created by Kaspars Jelaiskis on 01/09/2023.
//

import SwiftUI

struct CommandViewLieDown: View {
    @Environment(\.presentationMode) var presentationMode
    let bgColor = Color(red: 250.0/255.0, green: 250.0/255.0, blue: 250.0/255.0)
    @AppStorage("isLieDownFave") private var isLieDownFave = false

    var body: some View {
        
        ZStack(alignment: .topTrailing) {
            bgColor.ignoresSafeArea()
            
            HStack {
                FavoriteButton(isFavorite: $isLieDownFave)
            
                Spacer()
                CloseSheetButton {
                    presentationMode.wrappedValue.dismiss()
                }
            }
            .zIndex(3)
            
            VStack(alignment: .leading, spacing: 16) {
                
                Image("LieDown")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding([.leading, .trailing], 16)
                
                Text("Lie down")
                    .font(.custom("SignikaNegative-SemiBold", size: 24))
                    .padding(.leading, 16)
                
                VStack(alignment: .leading) {
                    Text("• Start with your dog in a sitting position. \n \n • Hold a treat close to their nose, then move your hand downwards to the ground. \n \n • As they follow the treat, their body will lower to the ground. Once they are lying down, say \"Down\" and reward them. ")
                        .font(.custom("Poppins-Regular", size: 16))
                }
                
                .padding([.leading, .trailing], 16)
                
                Spacer()
            }
        }
       
    }
}

struct CommandViewLieDown_Previews: PreviewProvider {
    static var previews: some View {
        CommandViewLieDown()
    }
}
