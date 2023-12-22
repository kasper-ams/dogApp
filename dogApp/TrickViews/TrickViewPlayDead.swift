//
//  TrickViewPlayDead.swift
//  dogApp
//
//  Created by Kaspars Jelaiskis on 15/09/2023.
//

import SwiftUI

struct TrickViewPlayDead: View {
    @Environment(\.presentationMode) var presentationMode
    var bgColor = Color(red: 250.0/255.0, green: 250.0/255.0, blue: 250.0/255.0)
    @AppStorage("isPlayDeadFave") var isPlayDeadFave = false
    @StateObject var favoriteItems = FavoriteItems()
    
    var body: some View {
        
        ZStack(alignment: .topTrailing) {
            
            bgColor.ignoresSafeArea()
            
            HStack {
                FavoriteButton(isFavorite: $isPlayDeadFave)
             
                Spacer()
                
                CloseSheetButton {
                    presentationMode.wrappedValue.dismiss()
            
                }
            }
            .zIndex(3)
            
            ScrollView {
                    VStack(alignment: .leading, spacing: 16) {
                        
                        Image("playDead")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .padding([.leading, .trailing], 16)
                        
                        Text("Play dead")
                            .font(.custom("SignikaNegative-SemiBold", size: 24))
                            .padding(.leading, 16)
                        
                        VStack(alignment: .leading, spacing: 16) {
                            
                            Group {
                                Text("Before you start teaching \"play dead,\" your dog should already know basic commands like \"sit,\" \"down,\" and \"stay.\" If your dog is not familiar with these commands, it's a good idea to work on them first, as they will be the foundation for the \"play dead\" trick.")
                                    .font(.custom("Poppins-Regular", size: 16))
                                
                                Text("Step 1: Start with the Down Position")
                                    .font(.headline)
                                
                                Text("Begin with your dog in the \"down\" position. If your dog doesn't already know this command, you can use a treat to lure them into a lying-down position. Hold a treat close to their nose and slowly lower it to the ground, prompting them to follow it and lie down. Once they are in the down position, reward them with the treat.")
                                    .font(.custom("Poppins-Regular", size: 16))
                                
                                Text("Step 2: Add the Cue")
                                    .font(.headline)
                                
                                Text("With your dog in the down position, use a verbal cue like \"bang,\" \"play dead,\" or any word or phrase you prefer. Simultaneously, use a hand gesture, like pointing your finger at them like a gun. Be consistent with your chosen cue and gesture.")
                                    .font(.custom("Poppins-Regular", size: 16))
                            }
                            
                            Text("Step 3: Encourage Rolling Over")
                                .font(.headline)
                            
                            Text("Gently encourage your dog to roll onto their side by lightly pressing on their shoulder or hip, depending on which side you want them to play dead on. At the same time, maintain the \"bang\" command and the hand gesture.")
                                .font(.custom("Poppins-Regular", size: 16))
                            
                            Text("Step 4: Reward and Praise")
                                .font(.headline)
                            
                            Text("As soon as your dog is lying on their side, reward them with a treat and plenty of praise. Use a happy and excited tone of voice to let them know they did a fantastic job.")
                                .font(.custom("Poppins-Regular", size: 16))
                            
                            Text("Step 5: Repeat and Practice")
                                .font(.headline)
                            
                            Text("Practice this trick regularly in short training sessions. Be patient, and remember that some dogs may take longer to grasp the concept than others. Consistency and positive reinforcement are essential. \n \nAs your dog becomes more comfortable with the \"play dead\" trick, you can refine it by extending the time they stay in the down position before rewarding them. Gradually, you can work on having them stay in the position for longer durations.")
                                .font(.custom("Poppins-Regular", size: 16))
                            
                        }
                        .padding([.leading, .trailing], 16)
                        
                        Spacer()
                    }
            }
        }
    }
}

struct TrickViewPlayDead_Previews: PreviewProvider {
    static var previews: some View {
        TrickViewPlayDead()
    }
}
