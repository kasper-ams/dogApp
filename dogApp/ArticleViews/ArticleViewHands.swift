//
//  ArticleViewHands.swift
//  dogApp
//
//  Created by Kaspars Jelaiskis on 11/11/2023.
//

import SwiftUI

struct ArticleViewHands: View {
    
    @Environment(\.presentationMode) var presentationMode
    var bgColor = Color(red: 250.0/255.0, green: 250.0/255.0, blue: 250.0/255.0)
    var body: some View {
        
        ZStack(alignment: .topTrailing) {
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
                        
                        
                        Text("Hand gesures in dog training")
                            .foregroundColor(.white)
                            .font(.custom("SignikaNegative-SemiBold", size: 24))
                            .padding(24)
                    }
                    
                    
                    VStack(alignment: .leading, spacing: 16) {
                        
                        Text("Training your dog is not just about vocal commands; it's also about creating a language of understanding through non-verbal communication. Hand gestures can be a powerful tool in fostering clear communication and reinforcing positive behavior. \n \nHere are some good examples to get you started.")
                            .font(.custom("Poppins-Regular", size: 16))
                        
                        
                        Text("Down")
                            .font(.headline)
                        Text("• Point your index finger toward the ground.")

                        Text("Come")
                            .font(.headline)
                        Text("• Extend your arm outward, palm facing up, and then bring your fingers toward your palm in a beckoning motion.")
                        
                        Text("Stay")
                            .font(.headline)
                        Text("• Hold your open palm, facing your dog, in a \"stop\" position.")
                        
                        Text("Wait")
                            .font(.headline)
                        Text("• Raise your hand, palm forward, like a traffic cop signaling to stop.")
                        
                        Text("Heel")
                            .font(.headline)
                        Text("• Hold your hand, fingers closed, at your side with your palm facing your leg.")
                        
                        Text("Quiet")
                            .font(.headline)
                        Text("• Place your index finger vertically in front of your lips.")
                        
    
                        
                    }
                    .padding(16)
                    
                    
                }
            }
        }
        
    }
}


#Preview {
    ArticleViewHands()
}
