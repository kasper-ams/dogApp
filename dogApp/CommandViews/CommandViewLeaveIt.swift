//
//  CommandViewLeaveIt.swift
//  dogApp
//
//  Created by Kaspars Jelaiskis on 08/09/2023.
//

import SwiftUI

struct CommandViewLeaveIt: View {
    let bgColor = Color(red: 250.0/255.0, green: 250.0/255.0, blue: 250.0/255.0)
    @Environment(\.presentationMode) var presentationMode
    @AppStorage("isLeaveItFave") var isLeaveItFave = false

    
    var body: some View {
        
        ZStack(alignment: .topTrailing) {
            bgColor.ignoresSafeArea()
            
            HStack {
                FavoriteButton(isFavorite: $isLeaveItFave)
            
                Spacer()
                CloseSheetButton {
                    presentationMode.wrappedValue.dismiss()
                }
            }
            .zIndex(3)
            
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    
                    Image("LeaveIt")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding([.leading, .trailing], 16)
                    
                    Text("Leave it")
                        .font(.custom("SignikaNegative-SemiBold", size: 24))
                        .padding(.leading, 16)
                    
                    VStack(alignment: .leading, spacing: 16) {
                        Group {
                            Text("Step 1: Get the Goods")
                                .font(.headline)
                            Text("Grab some tasty treats and your dog's leash (just in case).")
                                .font(.custom("Poppins-Regular", size: 16))
                            
                            Text("Step 2: Flash the Treat")
                                .font(.headline)
                            Text("Show your pup a treat, let them sniff it, but keep it hidden in your hand.")
                                .font(.custom("Poppins-Regular", size: 16))
                            
                            Text("Step 3: Say the Magic Words")
                                .font(.headline)
                            Text("With a grin, say \"Leave It\" in a clear, friendly tone.")
                                .font(.custom("Poppins-Regular", size: 16))
                            
                            Text("Step 4: Wait It Out")
                                .font(.headline)
                            Text("Wait for your dog to back off from your hand (even if it's just a little bit). The moment they do, give 'em a cheer, \"Good dog!\"")
                                .font(.custom("Poppins-Regular", size: 16))
                            
                            Text("Step 5: Swap and Reward")
                                .font(.headline)
                            Text("Now, surprise them with a different treat from your other hand as a reward.")
                                .font(.custom("Poppins-Regular", size: 16))
                        }
                        Text("Step 6: Repeat and Challenge")
                            .font(.headline)
                        Text("Practice, making it a bit tougher each time. Try with treats on the ground or more tempting items.")
                            .font(.custom("Poppins-Regular", size: 16))
                        
                        Text("Step 7: Real-Life Situations")
                            .font(.headline)
                        Text("Use \"Leave It\" during walks when they spot something interesting, and keep them safe.")
                            .font(.custom("Poppins-Regular", size: 16))
                        
                        Text("Step 8: Consistency Rules")
                            .font(.headline)
                        Text("Remember, consistency is key. Use \"Leave It\" every time you need it.")
                            .font(.custom("Poppins-Regular", size: 16))
                        
                        Text("Step 9: Fun and Praise")
                            .font(.headline)
                        Text("Keep it upbeat and celebrate their successes. Your dog will be a \"Leave It\" pro in no time!")
                            .font(.custom("Poppins-Regular", size: 16))
                        
                    }
                    
                    .padding([.leading, .trailing], 16)
                    
                    Spacer()
                }
            }
        }
    }
}

struct CommandViewLeaveIt_Previews: PreviewProvider {
    static var previews: some View {
        CommandViewLeaveIt()
    }
}
