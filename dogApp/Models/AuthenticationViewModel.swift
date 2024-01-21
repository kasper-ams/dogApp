//
//  AuthenticationViewModel.swift
//  dogApp
//
//  Created by Kaspars Jelaiskis on 22/12/2023.
//

import Foundation

@MainActor
final class AuthenticationViewModel: ObservableObject {
    static let shared = AuthenticationViewModel()

    @Published var isUserSignedIn: Bool = false {
        didSet {
            DispatchQueue.main.async {
                print("isUserSignedIn didSet called")
                self.objectWillChange.send()
            }
        }
    }
        
    func signInGoogle() async throws {
        let helper = SignInGoogleHelper()
        let tokens = try await helper.signIn()
        let authDataResult = try await AuthenticationManager.shared.signInWithGoogle(tokens: tokens)
        let user = DBUser(auth: authDataResult)
        try await UserManager.shared.createNewUser(user: user)
        
        isUserSignedIn = true
        print("isUserSignedIn \(isUserSignedIn)")
    }
    
    func signInApple() async throws {
        let helper = SignInAppleHelper()
        let tokens = try await helper.startSignInWithAppleFlow()
        let authDataResult = try await AuthenticationManager.shared.signInWithApple(tokens: tokens)
        let user = DBUser(auth: authDataResult)
        try await UserManager.shared.createNewUser(user: user)
        
        isUserSignedIn = true
        print("isUserSignedIn \(isUserSignedIn)")

    }
    
//    func signInAnonymous() async throws {
//        let authDataResult = try await AuthenticationManager.shared.signInAnonymous()
//        let user = DBUser(auth: authDataResult)
//        try await UserManager.shared.createNewUser(user: user)
//    }

}
