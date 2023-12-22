//
//  Button.swift
//  dogApp
//
//  Created by Kaspars Jelaiskis on 09/09/2023.
//

import SwiftUI

struct GetNamesButton: View {
    
    let text: String
    let color = Color(red: 0.34, green: 0.36, blue: 0.84)
    let action: () -> Void

    var body: some View {
        
        Button(action: {
                    action()
                                }) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 8)
                            .fill(color)
                        Text(text)
                            .foregroundColor(.white)
                            .font(.custom("Poppins-Regular", size: 18))
                    }
                    .frame(maxWidth: .infinity, maxHeight: 56)
                    .frame(minWidth: 200, minHeight: 56)
            }
    }
        
}





struct Button_Previews: PreviewProvider {
    static var previews: some View {
        GetNamesButton(text: "Get names", action: {
            let randomDog = dogNames()
            randomDog.randomName()
        })
    }
}
