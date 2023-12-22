//
//  ArticleViewOldTraining.swift
//  dogApp
//
//  Created by Kaspars Jelaiskis on 05/09/2023.
//

import SwiftUI

struct ArticleViewOldTraining: View {
    
    @Environment(\.presentationMode) var presentationMode
    let bgColor = Color(red: 250.0/255.0, green: 250.0/255.0, blue: 250.0/255.0)
    var body: some View {
        
        ZStack(alignment: .topTrailing) {
            bgColor.ignoresSafeArea()
            
            CloseSheetButton {
                presentationMode.wrappedValue.dismiss()
            }
            
            ScrollView {
                VStack {
                    
                    ZStack(alignment: .bottomLeading) {
                        
                        Image("ColorCardNoCorners")
                            .resizable()
                            .frame(maxHeight: 200)
                            .aspectRatio(contentMode: .fill)
                        
                        Text("Are older dogs more difficult to train?")
                            .foregroundColor(.white)
                            .font(.custom("SignikaNegative-SemiBold", size: 24))
                            .padding(24)
                    }
                    
                    
                    VStack(alignment: .leading, spacing: 16) {
                        Group {
                            Text("Older dogs can sometimes be more challenging to train compared to puppies or younger dogs, but it's not a hard and fast rule. The ease or difficulty of training an older dog depends on several factors, including the individual dog's personality, prior training and socialization experiences, and any health issues they may have.")
                                .font(.custom("Poppins-Regular", size: 16))
                            
                            Text("Here are some factors to consider when training older dogs:")
                                .font(.custom("Poppins-Regular", size: 16))
                            
                            Text("Previous Training. ")
                                .font(.headline)
                            
                            Text("If the older dog has received prior training and has been well-socialized, they may have a foundation of basic obedience commands. However, if they were not properly trained or have developed bad habits, it may take some time to correct those behaviors.")
                                .font(.custom("Poppins-Regular", size: 16))
                            
                            Text("Health and Physical Limitations.")
                                .font(.headline)
                            
                            Text("Older dogs may have physical limitations due to aging or health issues. These limitations can affect their ability to learn and perform certain commands. It's important to consider their comfort and well-being during training.")
                                .font(.custom("Poppins-Regular", size: 16))
                            
                            Text("Temperament.")
                                .font(.headline)
                     
                        Text("Each dog has a unique temperament, regardless of age. Some older dogs may be more stubborn or set in their ways, while others are still eager to learn and please their owners.")
                                .font(.custom("Poppins-Regular", size: 16))
                        
                        Text("Patience and Consistency")
                            .font(.headline)
                        
                        Text("Training an older dog may require more patience and consistency on the owner's part. It can take longer for them to grasp new commands or unlearn bad habits, so being patient and using positive reinforcement is crucial.")
                                .font(.custom("Poppins-Regular", size: 16))
                        }
                        
                        Text("Socialization.")
                            .font(.headline)
                        
                        Text("Socialization is essential for dogs of all ages, but older dogs may have missed out on crucial socialization experiences as puppies. This can make them more apprehensive or reactive in certain situations, requiring additional training and socialization efforts.")
                            .font(.custom("Poppins-Regular", size: 16))
                        
                        Text("In summary, while older dogs can be more challenging to train in some cases, it's not impossible. Patience, consistency, and positive reinforcement are essential when working with older dogs. It's also important to tailor your training approach to your dog's individual needs and abilities. Seeking guidance from a professional dog trainer can be helpful if you're having difficulty training an older dog, as they can provide tailored advice and strategies.")
                            .font(.custom("Poppins-Regular", size: 16))
                       
                        
                        
                    }
                    .padding(16)
                }
            }
        }
        
    }
}

struct ArticleViewOldTraining_Previews: PreviewProvider {
    static var previews: some View {
        ArticleViewOldTraining()
    }
}
