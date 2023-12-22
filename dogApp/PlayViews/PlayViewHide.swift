//
//  PlayViewHide.swift
//  dogApp
//
//  Created by Kaspars Jelaiskis on 15/09/2023.
//

import SwiftUI

struct PlayViewHide: View {
    @Environment(\.presentationMode) var presentationMode
    var bgColor = Color(red: 250.0/255.0, green: 250.0/255.0, blue: 250.0/255.0)
    
    
    @AppStorage("isHideFave") var isHideFave = false
    @StateObject var favoriteItems = FavoriteItems()
    
    var body: some View {
        
        ZStack(alignment: .topTrailing) {
                bgColor.ignoresSafeArea()
            
            HStack {
                FavoriteButton(isFavorite: $isHideFave)
             
                Spacer()
                
                CloseSheetButton {
                    presentationMode.wrappedValue.dismiss()
            
                }
            }
            .zIndex(3)
            
                ScrollView {

                VStack(alignment: .leading, spacing: 16) {
                    
                    Image("hideAndSeek")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding([.leading, .trailing], 16)
                    
                    Text("Hide and seek")
                        .font(.custom("SignikaNegative-SemiBold", size: 24))
                        .padding(.leading, 16)
                  
                    
                   
                    VStack(alignment: .leading, spacing: 16) {
                        Group{
                            Text("Dogs love this game because it engages their natural hunting and tracking instincts while providing mental stimulation and exercise. Here's how to play!")
                                .font(.custom("Poppins-Regular", size: 16))
                            
                            Text("Step 1: Find a Suitable Location")
                                .font(.headline)
                            
                            Text("Start in a room where your dog can't see you, like behind a closed door or around a corner.")
                                .font(.custom("Poppins-Regular", size: 16))
                            
                            Text("Step 2: Command Your Dog to Stay")
                                .font(.headline)
                            
                            Text("Tell your pup to \"sit\" or \"stay\" while you prepare for your epic hide-and-seek mission. Make sure they're ready for action!")
                                .font(.custom("Poppins-Regular", size: 16))
                            
                            Text("Step 3: Hide!")
                                .font(.headline)
                            
                            Text("While your dog's on standby, find the perfect hiding spot in your house or yard. Start with easy-peasy spots like behind the couch or in an open closet. Later, you can up the ante with some expert-level hiding places!")
                                .font(.custom("Poppins-Regular", size: 16))
                        }
                        
                        Text("Step 4: Rally Your Detective Pup!")
                            .font(.headline)
                        
                        Text("Now, with the enthusiasm level cranked up to 11, call your dog using your best secret agent voice. Try something like, \"Come find me, Super Pup!\" or \"Where's the treat treasure, detective dog?\"")
                            .font(.custom("Poppins-Regular", size: 16))
                        
                        Text("Step 5: Let the Hunt Begin")
                            .font(.headline)
                        
                        Text("Your furry detective will put their super sniffing skills to work. They'll follow the scent trail you left behind and embark on the ultimate quest to find you. Stay cool and quiet in your hidey-hole.")
                            .font(.custom("Poppins-Regular", size: 16))
                        
                        Text("Step 6: The Grand Reunion")
                            .font(.headline)
                        
                        Text("When your trusty sidekick finally busts you, it's time to celebrate! Shower them with praise, treats, and a victory dance. They're officially the Hide-and-Seek Champion of the Universe!")
                            .font(.custom("Poppins-Regular", size: 16))
                        
                    }
                    .padding([.leading, .trailing], 16)

                    Spacer()
                }
            }
        }
    }
}

struct PlayViewHide_Previews: PreviewProvider {
    static var previews: some View {
        PlayViewHide()
    }
}
