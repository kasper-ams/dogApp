//
//  FavoriteViewModel.swift
//  dogApp
//
//  Created by Kaspars Jelaiskis on 03/01/2024.
//

import Foundation
import SwiftUI
import Combine



@MainActor
final class FavoriteViewModel: ObservableObject {
    @StateObject private var viewModel = ProfileViewModel()
    @StateObject private var authModel = AuthenticationViewModel.shared

    
    @Published private(set) var userFavoriteItems: [UserFavoriteItem] = []
    private var cancellables = Set<AnyCancellable>()

    func addListenerForFavorites() {
        guard let authDataResult = try? AuthenticationManager.shared.getAuthenticatedUser() else { return }
        
        UserManager.shared.addListenerForAllUserFavoriteItems(userId: authDataResult.uid)
            .sink { completion in
                
            } receiveValue: { [weak self] items in
                self?.userFavoriteItems = items
            }
            .store(in: &cancellables)
    }
    
    
    func removeFromFavorites(favoriteItemtId: String) {
        Task {
            let authDataResult = try AuthenticationManager.shared.getAuthenticatedUser()
            if let itemId = Int(favoriteItemtId) {
                try? await UserManager.shared.removeUserFavoriteItem(userId: authDataResult.uid, favoriteItemId: itemId)
            } else {
                print("Invalid item ID format")
            }
        }
    }

}
