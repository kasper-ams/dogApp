//
//  TrickViewBark.swift
//  dogApp
//
//  Created by Kaspars Jelaiskis on 17/09/2023.
//

import SwiftUI

struct TrickViewBark: View {
    @Environment(\.presentationMode) var presentationMode
    @AppStorage("isBarkFave") var isBarkFave = false
    @StateObject var favoriteItems = FavoriteItems()

    var bgColor = Color(red: 250.0/255.0, green: 250.0/255.0, blue: 250.0/255.0)
    var body: some View {
        ZStack(alignment: .topTrailing) {
            
            bgColor.ignoresSafeArea()
            
            HStack {
                FavoriteButton(isFavorite: $isBarkFave)
             
                Spacer()
                
                CloseSheetButton {
                    presentationMode.wrappedValue.dismiss()
            
                }
            }
            .zIndex(3)
            
            ScrollView {
                
            VStack(alignment: .leading, spacing: 16) {
                
                    Image("bark")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding([.leading, .trailing], 16)
                    
                    Text("Bark on command")
                        .font(.custom("SignikaNegative-SemiBold", size: 24))
                        .padding(.leading, 16)
                    
                    VStack(alignment: .leading, spacing: 16) {
                        Group {
                            Text("Teaching your dog to bark on command is kinda like having your own little alarm system. Here's how you can do it:")
                                .font(.custom("Poppins-Regular", size: 16))
                            
                            Text("Start with some tasty treats")
                                .font(.headline)
                            
                            Text("Get your dog's attention with their favorite snacks. Make sure you have them handy.")
                                .font(.custom("Poppins-Regular", size: 16))
                            
                            Text("Pick a cue word")
                                .font(.headline)
                            
                            Text("Choose a word like \"speak\" or \"bark.\" This is what you'll say when you want your pup to bark.")
                                .font(.custom("Poppins-Regular", size: 16))
                            
                            Text("Say the cue word")
                                .font(.headline)
                            
                            Text("Say your chosen word, like \"speak,\" in a cheerful voice. Your dog might give you a weird look at first, but that's okay.")
                                .font(.custom("Poppins-Regular", size: 16))
                            
                            Text("Wait for a bark")
                                .font(.headline)
                            
                            Text("Be patient. Your dog might not get it right away. But as soon as they bark—even if it's just a little woof—give them a treat and lots of praise. They'll figure out that barking when you say \"speak\" gets them treats and love.")
                                .font(.custom("Poppins-Regular", size: 16))
                        }
                        
                        Text("Repeat")
                            .font(.headline)
                        
                        Text("Practice this a bunch of times. Keep saying \"speak,\" and when your dog barks, reward them. They'll catch on with some practice")
                            .font(.custom("Poppins-Regular", size: 16))
                        
                        Text("Add some time")
                            .font(.headline)
                        
                        Text("Once your pup gets the hang of it, try making them bark for a bit longer before giving them a treat. This helps them understand that they should keep barking until you say \"enough\" or whatever word you want to use to stop them.")
                            .font(.custom("Poppins-Regular", size: 16))
                        
                        
                    }
                    .padding([.leading, .trailing], 16)
                    
                    Spacer()
                }
            }
        }
    }
}

struct TrickViewBark_Previews: PreviewProvider {
    static var previews: some View {
        TrickViewBark()
    }
}
