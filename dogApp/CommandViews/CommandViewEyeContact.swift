//
//  CommandViewEyeContact.swift
//  dogApp
//
//  Created by Kaspars Jelaiskis on 30/09/2023.
//

import SwiftUI

struct CommandViewEyeContact: View {
    let bgColor = Color(red: 250.0/255.0, green: 250.0/255.0, blue: 250.0/255.0)
    @Environment(\.presentationMode) var presentationMode
    @AppStorage("isEyeContactFave") private var isEyeContactFave = false

    var body: some View {
        
        ZStack(alignment: .topTrailing) {
            
            bgColor.ignoresSafeArea()
            
            HStack {
                FavoriteButton(isFavorite: $isEyeContactFave)
                  
                Spacer()
                CloseSheetButton {
                    presentationMode.wrappedValue.dismiss()
                }
            }
            .zIndex(3)
            
            ScrollView {
                
                VStack(alignment: .leading, spacing: 16) {
                    
                    Image("Look")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding([.leading, .trailing], 16)
                    
                    Text("Eye contact")
                        .font(.custom("SignikaNegative-SemiBold", size: 24))
                        .padding(.leading, 16)
                    
                    VStack(alignment: .leading, spacing: 16) {
                        
                        Text("This is a useful command to practice as it reinforces your dog to pay attention to you.")
                            .font(.custom("Poppins-Regular", size: 16))
                        
                        Text("• Choose a simple word or phrase like \"watch me\" or \"look at me\". This will serve as the command you use to instruct your dog to make eye contact with you. \n \n • Hold a treat up near your face to get their attention. \n \n • When you give the cue (e.g., \"watch me\"), wait for your dog to make eye contact with you. As soon as they do, immediately reward them with the treat and offer verbal praise.")
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
    CommandViewEyeContact()
}
