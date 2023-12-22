//
//  NavCard.swift
//  dogApp
//
//  Created by Kaspars Jelaiskis on 01/09/2023.
//

import SwiftUI

struct NavCard: View {
    
    let image: String
    let text: String
    let badge: String
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 4) {
            ZStack(alignment: .bottomTrailing) {
                Image(image)
                    .resizable()
                    .frame(width: 220.0, height: 120.0)
                    .shadow(color: Color(red: 0.8823529411764706, green: 0.8823529411764706, blue: 0.8823529411764706), radius: 8)
                Image(badge)
                    .padding([.bottom, .trailing], 8)
                    
            }
            Text(text)
                .foregroundColor(.black)
                .font(.custom("Poppins-Regular", size: 16))
        }
    }
}

struct NavCard_Previews: PreviewProvider {
    static var previews: some View {
        NavCard(image: "ImageContainer", text: "Text", badge: "Pill-1")
    }
}
