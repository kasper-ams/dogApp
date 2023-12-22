//
//  ArticleCard.swift
//  dogApp
//
//  Created by Kaspars Jelaiskis on 04/09/2023.
//

import SwiftUI

struct ArticleCard: View {
    
    let badge: String
    let textBold: String
    let textRegular: String
    let image: String

    var body: some View {
         
        VStack(alignment: .leading, spacing: 12) {
            
            ZStack(alignment: .leading) {
                Image(image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 178)
                    .frame(maxWidth: 400)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                
          
                VStack(alignment: .leading) {
                    Image(badge)
                    Spacer()
                }
                .padding(24)
            }
            .frame(maxWidth: 400, maxHeight: 178)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(textBold)
                    .foregroundColor(.black)
                    .font(.custom("Poppins-Regular", size: 16))                    .fontWeight(.medium)
                .multilineTextAlignment(.leading)
                
                Text(textRegular)
                    .foregroundColor(.gray)
                    .font(.custom("Poppins-Regular", size: 14))                    .fontWeight(.medium)
                    .multilineTextAlignment(.leading)
            }
            
           
        }
        
       
    }
    
}

struct ArticleCard_Previews: PreviewProvider {
    static var previews: some View {
        ArticleCard(badge: "PillArt", textBold: "Article title", textRegular: "Article subtitle", image: "heel")
    }
}
