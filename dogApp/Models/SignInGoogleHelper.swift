//
//  SignInGoogleHelper.swift
//  dogApp
//
//  Created by Kaspars Jelaiskis on 22/12/2023.

//copy paste this into another app if needed
// https://github.com/SwiftfulThinking/SwiftfulFirebaseAuth/blob/main/Sources/SwiftfulFirebaseAuth/Helpers/SignInWithGoogle.swift - better reusable code
// https://youtu.be/mdQcqPq9Kl4?si=7g_3FlRWZbWLir22&t=2084 - remove the email functions if needed


import Foundation
import GoogleSignIn
import GoogleSignInSwift

struct GoogleSignInResultModel {
    let idToken: String
    let accessToken: String
    let name: String?
    let email: String?
}



final class SignInGoogleHelper {
    
    @MainActor
    func signIn() async throws -> GoogleSignInResultModel {
        guard let topVC = Utilities.shared.topViewController() else {
            throw URLError(.cannotFindHost)
        }
        
        let gidSignInResult = try await GIDSignIn.sharedInstance.signIn(withPresenting: topVC)
        
        guard let idToken = gidSignInResult.user.idToken?.tokenString else {
            throw URLError(.badServerResponse)
        }
        
        let accessToken = gidSignInResult.user.accessToken.tokenString
        let name = gidSignInResult.user.profile?.name
        let email = gidSignInResult.user.profile?.email

        let tokens = GoogleSignInResultModel(idToken: idToken, accessToken: accessToken, name: name, email: email)
        return tokens
    }
    
}
