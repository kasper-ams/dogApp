//
//  LessonButton.swift
//  dogApp
//
//  Created by Kaspars Jelaiskis on 12/01/2024.
//

import SwiftUI

struct LessonButton: View {
    let activeColor = Color(red: 0, green: 0.43, blue: 0.47)

    let text: String
    let isComplete: Bool
    let action: () -> Void
    let isPreviousTaskComplete: Bool
    
    var isButtonEnabled: Bool {
           return isComplete || isPreviousTaskComplete
       }
    
    var body: some View {
        Button(action: {
            action()
        }) {
            HStack {
                Image(systemName: isComplete ? "checkmark" : (isPreviousTaskComplete ? "circle" : "lock" ))
                    .foregroundColor(isComplete ? .black : (isPreviousTaskComplete ? activeColor : .gray))
                Text(text)
                    .font(Font.custom("Poppins", size: 16))
                    .foregroundColor(isComplete ? .black : (isPreviousTaskComplete ? activeColor : .gray))
            }
        }
        .disabled(!isButtonEnabled)
    }
}

//#Preview {
//    LessonButton(text: "Sit", image: "circle", isSelected: constant(false)) {
//        return
//    }
//}

