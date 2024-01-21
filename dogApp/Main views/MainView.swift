//
//  ContentView.swift
//  dogApp
//
//  Created by Kaspars Jelaiskis on 30/08/2023.
//

import SwiftUI
import FirebaseAnalytics
import FirebaseAnalyticsSwift

struct MainView: View {
    @State private var showSignedInView: Bool = false
    @State private var userIsLoggedIn = false
    
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
            
            ProfileView()
                .tabItem {
                    Label("Profile", image: "profile")
                }
            
            
        }
        .onAppear() {
            UITabBar.appearance().barTintColor = .white
            let authUser = try? AuthenticationManager.shared.getAuthenticatedUser()
            //            self.showSignedInView = authUser == nil
        }
        
    }
    //        .fullScreenCover(isPresented: $showSignedInView, content: {
    //            NavigationStack {
    //                AuthenticationView(showSignInView: $showSignedInView)
    //            }})
    
}





struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
    
}

