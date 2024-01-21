//
//  AchievementItem.swift
//  dogApp
//
//  Created by Kaspars Jelaiskis on 24/12/2023.
//

import SwiftUI

struct AchievementItem: View {
    
    let text: String
    
    var body: some View {
        
        HStack {
            Image("checkRibbon")
            Text(text)
                .font(.custom("Poppins-Regular", size: 16))
                .foregroundColor(Color (red: 0.31, green: 0.31, blue: 0.31))
        }
    }   
}

#Preview {
    AchievementItem(text: "text")
}
