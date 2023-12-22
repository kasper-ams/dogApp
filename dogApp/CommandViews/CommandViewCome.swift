//
//  CommandViewCome.swift
//  dogApp
//
//  Created by Kaspars Jelaiskis on 09/09/2023.
//

import SwiftUI

struct CommandViewCome: View {
    let bgColor = Color(red: 250.0/255.0, green: 250.0/255.0, blue: 250.0/255.0)
    @Environment(\.presentationMode) var presentationMode
    @AppStorage("isRecallFave") private var isRecallFave = false

    var body: some View {
        
        
        ZStack(alignment: .topTrailing) {
            bgColor.ignoresSafeArea()
            
            HStack {
                FavoriteButton(isFavorite: $isRecallFave)
            
                Spacer()
                CloseSheetButton {
                    presentationMode.wrappedValue.dismiss()
                }
            }
            .zIndex(3)
            
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    
                    Image("Come")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding([.leading, .trailing], 16)
                    
                    Text("Recall")
                        .font(.custom("SignikaNegative-SemiBold", size: 24))
                        .padding(.leading, 16)
                    
                    VStack(alignment: .leading, spacing: 16) {
                        
                        Text("Step 1: Happy Tone")
                            .font(.headline)
                        Text("Whenever you want your dog to come to you, use a cheerful and friendly tone. Be someone they want to hang out with!")
                            .font(.custom("Poppins-Regular", size: 16))
                        
                        Text("Step 2: Treat Time")
                            .font(.headline)
                        Text("Have some delicious treats ready. Something your dog can't resist!")
                            .font(.custom("Poppins-Regular", size: 16))
                        
                        Text("Step 3: Say Their Name and \"Come\"")
                            .font(.headline)
                        Text("Call your dog's name followed by \"Come\" in a happy voice, like \"Buddy, come!\"")
                            .font(.custom("Poppins-Regular", size: 16))
                        
                        Text("Step 4: Reward and Praise")
                            .font(.headline)
                        Text("When they come to you, immediately give them a treat and shower them with praise. Be their biggest fan!")
                            .font(.custom("Poppins-Regular", size: 16))
                        
                        Text("Step 5: Play and Repeat")
                            .font(.headline)
                        Text("Sometimes, make it a game! After they come, play with a toy or have a short play session. Keep practicing, and they'll come running every time you call. \n \n Remember, keep it enjoyable for your furry friend, and coming to you will be their favorite thing to do!")
                            .font(.custom("Poppins-Regular", size: 16))
                        
                        
                        
                    }
                    
                    .padding([.leading, .trailing], 16)
                    
                    Spacer()
                }
            }
        }
    }
}

struct CommandViewCome_Previews: PreviewProvider {
    static var previews: some View {
        CommandViewCome()
    }
}
