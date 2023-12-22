//
//  SmallCard.swift
//  dogApp
//
//  Created by Kaspars Jelaiskis on 12/09/2023.
//

import SwiftUI

struct SmallCard: View {
    
    let text: String
    let image: String
    let colorTop = Color(red: 1.0/255.0, green: 110.0/255.0, blue: 120.0/255.0)
    let colorBottom = Color(red: 51.0/255.0, green: 138.0/255.0, blue: 146.0/255.0)
    
    var body: some View {
        
        ZStack(alignment: .trailing) {
           
            ZStack(alignment: .leading) {
                
                RoundedRectangle(cornerRadius: 8)
                    .fill(LinearGradient(colors: [colorBottom, colorTop ], startPoint: .top, endPoint: .bottom))
                
                
                
                Text(text)
                    .foregroundColor(.white)
                    .font(.custom("SignikaNegative-SemiBold", size: 24))
                    .fontWeight(.medium)
                    .multilineTextAlignment(.leading)
                    .padding(24)
                
            }
            .frame(maxWidth: .infinity, maxHeight: 75)
            .frame(minWidth: 200, minHeight: 75)
            
            Image("heartBubble")
                .padding(.bottom, 80)
        }
        
        
        
        
        
        
        
    }
}

struct SmallCard_Previews: PreviewProvider {
    static var previews: some View {
        SmallCard(text: "text", image: "heartBubble")
    }
}
