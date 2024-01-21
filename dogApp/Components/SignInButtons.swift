//
//  SignInButtons.swift
//  dogApp
//
//  Created by Kaspars Jelaiskis on 26/12/2023.
//

import SwiftUI
import GoogleSignIn
import GoogleSignInSwift

struct SignInButtons: View {
    
    @StateObject private var viewModel = ProfileViewModel()
    @StateObject private var authViewModel = AuthenticationViewModel.shared
    @State private var refreshView = false
    
    var refreshViewCallback: () -> Void

    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 20) {
            Text("Log in to save your progress.")
                .font(.custom("Poppins-Regular", size: 16))
                .foregroundColor(Color.gray)
            // sign in with apple
            Button(action: {
                Task {
                    do {
                        try await authViewModel.signInApple()
                        refreshViewCallback()
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
                        refreshViewCallback()
                    } catch {
                        print(error)
                    }
                }
            }
        }
    }
}

#Preview {
    SignInButtons {
        print("_")
    }
}
