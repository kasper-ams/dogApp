//
//  DailyChallengeCard.swift
//  dogApp
//
//  Created by Kaspars Jelaiskis on 10/12/2023.
//

import SwiftUI

struct DailyChallengeCard: View {
    
    let text: String
    let image: String
    

    
    var body: some View {
               ZStack(alignment: .leading) {
                   RoundedRectangle(cornerRadius: 12)
                       .fill(Color.white)
                       .overlay(RoundedRectangle(cornerRadius: 12)
                           .stroke(Color(red: 235/255, green: 235/255, blue: 235/255), lineWidth: 1)
                       )

                   HStack {
                       Image(image)
                           .resizable()
                           .frame(width: 48, height: 48)
                           .clipShape(Circle())
                       Text(text)
                           .foregroundColor(.black)
                           .font(.custom("Poppins-Medium", size: 16))
                   }
                   .padding(.leading, 8)
               }
               .frame(width: .infinity, height: 64)
           }
       
}

#Preview {
    DailyChallengeCard(text: "Practice this today", image: "heel")
}
