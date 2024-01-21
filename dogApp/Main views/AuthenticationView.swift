//
//  AuthenticationView.swift
//  dogApp
//
//  Created by Kaspars Jelaiskis on 22/12/2023.
//

import SwiftUI
import GoogleSignIn
import GoogleSignInSwift
import AuthenticationServices
import CryptoKit

struct AuthenticationView: View {
    @Environment(\.presentationMode) var presentationMode
    let bgColor = Color(red: 250.0/255.0, green: 250.0/255.0, blue: 250.0/255.0)
    @StateObject private var viewModel = AuthenticationViewModel.shared
    @State private var refreshView = false
    @State private var isSheetPresented = true
    
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .topTrailing) {
                bgColor.ignoresSafeArea()
                CloseSheetButton {
                    presentationMode.wrappedValue.dismiss()
                }
                VStack {
                    Spacer()
                    SignInButtons(refreshViewCallback: {
                        self.refreshView.toggle()
                        // Check if the user is signed in and dismiss the sheet
                        if viewModel.isUserSignedIn {
                            print("user is signed in")
                            presentationMode.wrappedValue.dismiss()
                        }
                    })
                }
                .padding()
            }
            
        }
        
        
    }
}


#Preview {
    AuthenticationView()
}
