//
//  ProgramCard.swift
//  dogApp
//
//  Created by Kaspars Jelaiskis on 13/11/2023.
//

import SwiftUI

struct ProgramCard: View {
    
    let text: String
    let image: String
    
    let colorTop: Color
    let colorBottom: Color

    var body: some View {
        
    
        
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 8)
                .fill(LinearGradient(colors: [colorTop, colorBottom], startPoint: .top, endPoint: .bottom))
            
            HStack {
                
                VStack(alignment: .leading) {
                    Spacer()
                    Text(text)
                        .foregroundColor(.white)
                        .font(.custom("SignikaNegative-SemiBold", size: 24))                    
                        .multilineTextAlignment(.leading)
                }
                Spacer()
                Image(image)
                    .resizable()
                    .frame(width: 100, height: 100)
                    .mask(Circle())
                    .overlay(Circle()
                        .stroke(Color.white, lineWidth: 4))
               
            }
            .padding(24)
            
        }
        .frame(width: 360, height: 170)

    }
}

#Preview {
    ProgramCard(text: "My first dog", image: "listCups", colorTop: Color(red: 231/255.0, green: 150/255.0, blue: 105/255.0), colorBottom: Color(red: 225/255.0, green: 124/255.0, blue: 67/255.0))
}
