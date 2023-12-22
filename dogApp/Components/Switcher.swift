//
//  Awitcher.swift
//  dogApp
//
//  Created by Kaspars Jelaiskis on 11/09/2023.
//

import SwiftUI

struct Switcher: View {
    
    let text: String
    let fillColor = Color(red: 228.0/255.0, green: 242.0/255.0, blue: 242.0/255.0)
    let borderColor = Color(red: 1.0/255.0, green: 110.0/255.0, blue: 120.0/255.0)
    @Binding var state: Bool
    
    init(text: String, state: Binding<Bool>) {
        self.text = text
        self._state = state
    }
    
    
    var body: some View {
        
        
        HStack {
            Toggle(text, isOn: $state)
                .toggleStyle(.button)
                .tint(.mint)
                .font(.title3)
                .foregroundColor(borderColor)
                
 
        }
     
    }
    
    
    
    
}





struct Switcher_Previews: PreviewProvider {
    static var previews: some View {
        Switcher(text: "Male", state: .constant(true))
    }
}
