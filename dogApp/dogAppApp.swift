//
//  dogAppApp.swift
//  dogApp
//
//  Created by Kaspars Jelaiskis on 30/08/2023.
//

import SwiftUI
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        return true
    }
}

@main
struct dogAppApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    @StateObject private var authStateManager = AuthStateManager()
    @StateObject private var profileViewModel = ProfileViewModel()


    
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(authStateManager)
                .environmentObject(profileViewModel)
        }
    }
}
