//
//  ArticleViewGrooming.swift
//  dogApp
//
//  Created by Kaspars Jelaiskis on 31/10/2023.
//

import SwiftUI

struct ArticleViewGrooming: View {
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
                            
                        
                        Text("Beginners guide to grooming")
                            .foregroundColor(.white)
                            .font(.custom("SignikaNegative-SemiBold", size: 24))
                            .padding(24)
                    }
                    
                    
                    VStack(alignment: .leading, spacing: 16) {
                        Group {
                            Text("Grooming your dog is an essential part of their overall health and well-being. Regular grooming helps keep their coat clean, prevents matting, and allows you to check for any skin issues or abnormalities.")
                                .font(.custom("Poppins-Regular", size: 16))
                            
                            Text("Brushing Your Dog.")
                                .font(.headline)
                            
                            Text("Start by choosing the appropriate brush for your dog's coat type. There are various types of brushes, such as bristle brushes, slicker brushes, and undercoat rakes. It'a a good idea to have several brushes, especially for longer coats. \n \nAllow your dog to smell and get familiar with the brush before using it. Add treats and positive reinforcement to help your dog associate grooming with a positive experience. \n \nEstablish a routine for brushing your dog. Short-haired breeds typically require brushing once a week, while long-haired dogs may need daily brushing to prevent matting and tangles. Begin by gently brushing your dog's coat in the direction of hair growth. Pay close attention to areas prone to matting, like behind the ears, under the collar, and in the armpits. \n \nCarefully work through any mats and tangles using a dematting tool or a slicker brush. Be patient, and avoid pulling on the hair, as it can cause discomfort. \n \nIf your dog is anxious or too distracted, consider bringing it to a professional groomer first, which will create a more pleasant first experience.")
                                .font(.custom("Poppins-Regular", size: 16))
                            
                            
                        }
                        
                        
                    }
                    .padding(16)
                    
                    
                }
            }
        }
    }
}

#Preview {
    ArticleViewGrooming()
}
