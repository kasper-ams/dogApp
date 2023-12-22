//
//  CloseSheetButton.swift
//  dogApp
//
//  Created by Kaspars Jelaiskis on 27/09/2023.
//

import SwiftUI

struct CloseSheetButton: View {
    
    let action: () -> Void
    
    var body: some View {
        
        Button(action: action) {
            Image(systemName: "xmark")
                .foregroundColor(.white)
                .padding(8)
        }
        .background(Color(red: 0, green: 0, blue: 0, opacity: 60/255))
        .clipShape(Circle())
        .padding(24)
        .zIndex(3)
    }
}

struct CloseSheetButton_Previews: PreviewProvider {
    static var previews: some View {
        CloseSheetButton {
            return
        }
    }
}
