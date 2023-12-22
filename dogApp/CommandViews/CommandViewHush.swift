//
//  CommandViewHush.swift
//  dogApp
//
//  Created by Kaspars Jelaiskis on 30/09/2023.
//

import SwiftUI

struct CommandViewHush: View {
    let bgColor = Color(red: 250.0/255.0, green: 250.0/255.0, blue: 250.0/255.0)
    @Environment(\.presentationMode) var presentationMode
    @AppStorage("isHushFave") private var isHushFave = false

    var body: some View {
        
        ZStack(alignment: .topTrailing) {
            
            bgColor.ignoresSafeArea()
            
            HStack {
                FavoriteButton(isFavorite: $isHushFave)
            
                Spacer()
                CloseSheetButton {
                    presentationMode.wrappedValue.dismiss()
                }
            }
            .zIndex(3)
            
            ScrollView {
                
                VStack(alignment: .leading, spacing: 16) {
                    
                    Image("Hush")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding([.leading, .trailing], 16)
                    
                    Text("Hush")
                        .font(.custom("SignikaNegative-SemiBold", size: 24))
                        .padding(.leading, 16)
                    
                    VStack(alignment: .leading, spacing: 16) {
                        
                        Text("Tired of constant barking? It's time to teach your furry friend to hush on command! Here's how.")
                        
                        Text("Start with the Basics: Choose a quiet, distraction-free spot. \n \n Use the Command: Pick a word like \"quiet\" or \"hush\" and say it calmly. \n \n Wait for Silence: When your pup stops barking, even for a sec, reward with a treat! \n \n Practice, Practice, Practice: Consistency is key. Repeat until they get the hang of it. \n \n  Extend Quiet Time: Gradually ask for longer moments of silence before treating. \n \n Tip: you can combine it with the \"Bark\" command to practice both Speah and Hush.")
                            .font(.custom("Poppins-Regular", size: 16))
            
                        
                        
                 
                        
                     
                    }
                    
                    .padding([.leading, .trailing], 16)
                    
                    Spacer()
                }
            }
        }
    }
}

struct CommandViewHush_Previews: PreviewProvider {
    static var previews: some View {
        CommandViewHush()
    }
}
