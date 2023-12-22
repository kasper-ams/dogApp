//
//  SwitcherGroup.swift
//  dogApp
//
//  Created by Kaspars Jelaiskis on 11/09/2023.
//

import SwiftUI

struct SwitcherGroup: View {
    @State var stateMale: Bool = true
    @State var stateFemale: Bool = true

    var body: some View {
        HStack {
            Switcher(text: "Male", state: $stateMale)
                

            Switcher(text: "Female", state: $stateFemale)
                
        }
    }
    
 
}


struct SwitcherGroup_Previews: PreviewProvider {
    static var previews: some View {
        SwitcherGroup()
    }
}
