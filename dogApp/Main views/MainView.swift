//
//  ContentView.swift
//  dogApp
//
//  Created by Kaspars Jelaiskis on 30/08/2023.
//

import SwiftUI

struct MainView: View {
    
   
    var body: some View {
        
        TabView {
            
            HomeScreen()
                .tabItem {
                    Label("Home", image: "home")
                    
            }
            
            ListViewAll()
                .tabItem {
                    Label("Explore", image: "open-book")
            }
            
            ListViewFavorites()
                .tabItem {
                    Label("Favorites", image: "bookmark")
            }
            
            AboutView()
                .tabItem {
                    Label("About", image: "info")
                }
            
            
        }
        .onAppear(){
            UITabBar.appearance().barTintColor = .white

        }

        
    }
    
 
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
    
}

