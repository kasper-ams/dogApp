//
//  TabView.swift
//  dogApp
//
//  Created by Kaspars Jelaiskis on 26/09/2023.
//

import SwiftUI

struct TabView: View {
    var body: some View {
        
        TabView {
            
            MainView()
                .tabItem {
                    Label("StringProtocol", systemImage: "house")
                
      
            }
        }
        
       
    }
}

struct TabView_Previews: PreviewProvider {
    static var previews: some View {
        TabView()
    }
}
