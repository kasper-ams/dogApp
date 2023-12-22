//
//  ProgramCardSmall.swift
//  dogApp
//
//  Created by Kaspars Jelaiskis on 14/12/2023.
//

import SwiftUI

struct ProgramCardSmall: View {
    
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
                    .frame(width: 56, height: 56)
                    .mask(Circle())
                    .overlay(Circle()
                        .stroke(Color.white, lineWidth: 4))
               
            }
            .padding(24)
            
        }
        .frame(width: .infinity, height: 80)
    }
}

#Preview {
    ProgramCardSmall(text: "My first dog", image: "listCups", colorTop: Color(red: 1, green: 0.66, blue: 0.47), colorBottom: Color(red: 1, green: 0.58, blue: 0.35))
}
