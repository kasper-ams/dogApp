//
//  TrickViewJumpIntoArms.swift
//  dogApp
//
//  Created by Kaspars Jelaiskis on 07/09/2023.
//

import SwiftUI

struct TrickViewJumpIntoArms: View {
    @Environment(\.presentationMode) var presentationMode
    var bgColor = Color(red: 250.0/255.0, green: 250.0/255.0, blue: 250.0/255.0)
    @AppStorage("isHJumpFave") var isHJumpFave = false
    @StateObject var favoriteItems = FavoriteItems()
    
    var body: some View {
        
        ZStack(alignment: .topTrailing) {
            
            bgColor.ignoresSafeArea()
            HStack {
                FavoriteButton(isFavorite: $isHJumpFave)
             
                Spacer()
                
                CloseSheetButton {
                    presentationMode.wrappedValue.dismiss()
            
                }
            }
            .zIndex(3)
            
            ScrollView {
                    VStack(alignment: .leading, spacing: 16) {
                        
                        Image("JumpInArms")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .padding([.leading, .trailing], 16)
                        
                        Text("Jump into arms")
                            .font(.custom("SignikaNegative-SemiBold", size: 24))
                            .padding(.leading, 16)
                        
                        VStack(alignment: .leading, spacing: 16) {
                            
                            Group {
                                Text("Training your dog to jump into your arms can be a cute and affectionate trick. However, it's important to ensure your dog's safety and comfort during this training process. Here's a step-by-step guide to teach your dog to jump into your arms")
                                    .font(.custom("Poppins-Regular", size: 16))
                                
                                Text("Step 1: Choose a Fun Command")
                                    .font(.headline)
                                
                                Text("Start by picking a fun and catchy command word like \"Jump\" or \"Hop on.\"")
                                    .font(.custom("Poppins-Regular", size: 16))
                                
                                Text("Step 2: Find a Low Surface")
                                    .font(.headline)
                                
                                Text("Grab a low bench, step, or anything sturdy that's about the height of your dog's paws. Nothing too fancy, just something they can easily jump onto.")
                                    .font(.custom("Poppins-Regular", size: 16))
                            }
                            
                            Text("Step 3: Tempt and Reward")
                                .font(.headline)
                            
                            Text("Hold a tasty treat or your dog's favorite toy above their head, a little out of reach. Give your command word with a smile, like \"Jump!\" or \"Hop up!\"")
                                .font(.custom("Poppins-Regular", size: 16))
                            
                            Text("Step 4: Catch with Excitement")
                                .font(.headline)
                            
                            Text("As your pup leaps onto the surface, catch them gently with open arms and a big grin. Then, let the praise flow – \"Good job, you're amazing!\" – and give them treats and cuddles.")
                                .font(.custom("Poppins-Regular", size: 16))
                            
                            Text("Step 5: Raise the Bar (or Bench)")
                                .font(.headline)
                            
                            Text("Once they've got the hang of it, make it more exciting! Try higher surfaces, and remember, keep the party vibe going. The higher they jump, the more cheers and treats they get!")
                                .font(.custom("Poppins-Regular", size: 16))
                            
                            
                            Text("Training your dog should be fun for both of you, so keep it light and enjoyable. If they need a break or aren't getting it right away, no worries – just try again later. Happy jumping!")
                                .font(.custom("Poppins-Regular", size: 16))
                            
                        }
                        .padding([.leading, .trailing], 16)
                        
                        Spacer()
                    }
            }
        }
    }
}

struct TrickViewJumpIntoArms_Previews: PreviewProvider {
    static var previews: some View {
        TrickViewJumpIntoArms()
    }
}
