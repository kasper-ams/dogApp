//
//  LIstItem.swift
//  dogApp
//
//  Created by Kaspars Jelaiskis on 16/09/2023.
//

import SwiftUI

struct ListItem: View {
    let text: String
    let image: String

    var body: some View {
        VStack(spacing: 4) {
            
            Image(image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 80, height: 80)
                .clipShape(RoundedRectangle(cornerRadius: 8))
            
            Text(text)
                .font(.custom("SignikaNegative-Regular", size: 16))
                .frame(maxWidth: 72)
                .multilineTextAlignment(.center)

        }
       
    }
}

struct LIstItem_Previews: PreviewProvider {
    static var previews: some View {
        ListItem(text: "Jump into arms", image: "listSit")
    }
}
