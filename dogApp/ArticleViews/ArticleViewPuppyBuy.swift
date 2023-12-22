//
//  ArticleViewPuppyBuy.swift
//  dogApp
//
//  Created by Kaspars Jelaiskis on 02/09/2023.
//

import SwiftUI

struct ArticleViewPuppyBuy: View {
    
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
                            
                        
                        Text("What do I need to buy for my new puppy?")
                            .foregroundColor(.white)
                            .font(.custom("SignikaNegative-SemiBold", size: 24))
                            .padding(24)
                    }
                    
                    
                    VStack(alignment: .leading, spacing: 16) {
                        Group {
                            Text("Bringing a new puppy into your home is an exciting time, but it also requires some preparation. Here are five essential things you should buy for your new puppy:")
                                .font(.custom("Poppins-Regular", size: 16))
                            
                            Text("Food and Water Bowls.")
                                .font(.headline)
                            
                            Text("Invest in high-quality, appropriately sized food and water bowls for your puppy. Stainless steel or ceramic bowls are easy to clean and are less likely to harbor bacteria compared to plastic ones. Make sure the bowls are the right size for your puppy's breed and age.")
                                .font(.custom("Poppins-Regular", size: 16))
                            
                            Text("Dog Food.")
                                .font(.headline)
                            
                            Text("Choose a high-quality puppy food that is appropriate for your puppy's breed size (small, medium, or large) and age. Consult with your veterinarian or breeder for recommendations. Puppies have specific dietary needs, and it's important to provide them with the right nutrition for their growth and development.")
                                .font(.custom("Poppins-Regular", size: 16))
                            
                            Text("Crate or Dog Bed.")
                                .font(.headline)
                     
                        Text("A crate can be a valuable tool for house training and providing your puppy with a safe, comfortable space. Alternatively, you can invest in a cozy dog bed where your puppy can rest and sleep. Make sure the crate or bed is appropriately sized for your puppy's current size with some room to grow.")
                                .font(.custom("Poppins-Regular", size: 16))
                        
                        Text("Toys and Chew Items.")
                            .font(.headline)
                        
                        Text("Puppies are naturally curious and playful, so provide them with a variety of toys and chew items to keep them entertained and help with teething. Toys that can be stuffed with treats or puzzle toys that challenge their minds are especially beneficial. Ensure that the toys are safe for your puppy and free from small parts that can be swallowed.")
                                .font(.custom("Poppins-Regular", size: 16))
                        }
                        
                        Text("Bonus items to consider:")
                            .font(.headline)
                        
                        Text("• Grooming Supplies: Depending on your puppy's breed, you may need grooming supplies like brushes, combs, nail clippers, and shampoo.")
                            .font(.custom("Poppins-Regular", size: 16))
                        Text("• Puppy Proofing Supplies: Puppies are curious and can get into trouble. Baby gates, cabinet locks, and cord protectors can help keep your puppy safe and your home intact.")
                            .font(.custom("Poppins-Regular", size: 16))
                        Text("• Training Treats: High-quality treats are useful for positive reinforcement during training sessions.")
                            .font(.custom("Poppins-Regular", size: 16))
                        
                        
                    }
                    .padding(16)
                    
                    
                }
            }
        }
        
    }
}


struct ArticleViewPuppyBuy_Previews: PreviewProvider {
    static var previews: some View {
        ArticleViewPuppyBuy()
    }
}
