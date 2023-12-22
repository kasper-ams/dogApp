//
//  QuizButton.swift
//  dogApp
//
//  Created by Kaspars Jelaiskis on 29/11/2023.
//

import SwiftUI

struct QuizButtonFalse: View {
    
    let text: String
    let color = Color(red: 0.96, green: 0.96, blue: 0.96)
    let action: () -> Void
    @State private var isTapped = false

    
    var body: some View {
        
        Button(action: {
            action()
            isTapped.toggle()
        }) {
            ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: 8)
                    .fill(color)
                Text(text)
                    .foregroundColor(isTapped ? .gray : .black)
                    .strikethrough(isTapped, color: .gray)
                    .font(.custom("Poppins-Regular", size: 14))
                    .padding([.leading, .trailing], 16)
                    .multilineTextAlignment(.leading)
                    .lineLimit(nil)
                
            }
            
            .frame(idealHeight: 32)
            .frame(maxWidth: .infinity, maxHeight: 48)
           
            
        }
        .disabled(isTapped)
    }
}

#Preview {
    QuizButtonFalse(text: "String") {
        return
    }
}
