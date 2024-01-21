//
//  SignInSheet.swift
//  dogApp
//
//  Created by Kaspars Jelaiskis on 30/12/2023.
//

import SwiftUI
import GoogleSignIn
import GoogleSignInSwift

struct SignInSheet: View {
    
    @StateObject private var viewModel = ProfileViewModel()
    @StateObject private var authViewModel = AuthenticationViewModel.shared
    @State private var refreshView = false
    var onSignIn: (Bool) -> Void

    
    
    var body: some View {
        
        VStack(spacing: 24) {
            
            // sign in with apple
            Button(action: {
                Task {
                    do {
                        try await authViewModel.signInApple()
                        onSignIn(true)
                    } catch {
                        print(error)
                    }
                }
            }, label: {
                SignInWithAppleButtonViewRepresentable(type: .continue, style: .black)
                    .allowsHitTesting(false)
            })
            .frame(height: 55)
            .frame(maxWidth: .infinity)
            
            // sign in with google
            
            GoogleSignInButton(viewModel: GoogleSignInButtonViewModel(scheme: .dark, style: .wide, state: .normal)) {
                Task {
                    do {
                        try await authViewModel.signInGoogle()
                        onSignIn(true)
                    } catch {
                        print(error)
                    }
                }
            }
        }
        .padding()
        .presentationDetents([.height(200)])

        
    }
    
    
    
}

//
//#Preview {
//    SignInSheet()
//}
