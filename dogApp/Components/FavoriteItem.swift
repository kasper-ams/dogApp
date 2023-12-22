//
//  FavoriteItem.swift
//  dogApp
//
//  Created by Kaspars Jelaiskis on 17/10/2023.
//

import SwiftUI

struct FavoriteItem: View {
    let text: String
    let image: String
    
    var body: some View {
        HStack(spacing: 16) {
            Image(image)
                .resizable()
                .frame(width: 72, height: 72)
                .mask(Circle())
            
            Text(text)
                .font(.custom("SignikaNegative-Regular", size: 18))
                
                

            
        }
    }
}

#Preview {
    FavoriteItem(text: "Jump into arms", image: "listSit")
}
