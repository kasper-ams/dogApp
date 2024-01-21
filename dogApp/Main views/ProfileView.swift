//
//  ProfileView.swift
//  dogApp
//
//  Created by Kaspars Jelaiskis on 22/12/2023.
//

import SwiftUI
import GoogleSignIn
import GoogleSignInSwift

struct ProfileView: View {
    let bgColor = Color(red: 250.0/255.0, green: 250.0/255.0, blue: 250.0/255.0)
    
    @ObservedObject var viewModel = ProfileViewModel()
    @EnvironmentObject private var authStateManager: AuthStateManager


    @StateObject private var authViewModel = AuthenticationViewModel.shared
    @State private var refreshView = false
    
    @State private var programStatusFirst: String = "notStarted"
    @State private var programStatusLeash: String = "notStarted"
    @State private var programStatusOffice: String = "notStarted"


    
    var body: some View {
        
        NavigationView {
            
            ZStack {
                bgColor.ignoresSafeArea()
  
                    VStack(alignment: .leading, spacing: 24) {
                        
                        Text("My profile")
                            .font(.custom("SignikaNegative-SemiBold", size: 24))
                            .padding(.top, 24)
                                                                
                            if viewModel.isSignedIn {
                                
                                // content when user is signed in
                                VStack(alignment: .leading, spacing: 12) {
                                                                        
                                    if (viewModel.user?.email) != nil {
                                        Text("Signed in as \(viewModel.user?.email ?? "Loading...")")
                                            .font(.custom("Poppins-Regular", size: 16))
                                            .foregroundColor(Color.gray)
                                       }
                                    
                                    Spacer()
                                        .frame(height: 24)
                                    
                                    Text("Achievements")
                                        .font(.custom("SignikaNegative-Regular", size: 18))
                                    

                                    if programStatusFirst == "completed" {
                                        AchievementItem(text: "My first puppy")
                                    }
                                    if programStatusLeash == "completed" {
                                        AchievementItem(text: "Leash training")
                                    }
                                    if programStatusOffice == "completed" {
                                        AchievementItem(text: "Ready for office")
                                    }
                                
                                    if programStatusFirst != "completed" &&
                                               programStatusLeash != "completed" &&
                                               programStatusOffice != "completed" {
                                                Text("Complete training to see your progress")
                                                    .font(.custom("Poppins-Regular", size: 14))
                                                    .foregroundColor(Color.gray)
                                            }
                                    

                                    
                                    Spacer()
                                        .frame(height: 24)
                                    
                                    HStack(alignment: .center) {
                                        Button(action: {
                                            Task {
                                                do {
                                                    try viewModel.signOut()
                                                    refreshView.toggle()
                                                } catch {
                                                    print(error)
                                                }
                                            }
                                            print("signed out")
                                        }) {
                                            HStack {
                                                Image("signOut")
                                                Text("Sign out")
                                                    .font(.custom("Poppins", size: 16))
                                            }
                                            .padding()
                                            .cornerRadius(8)
                                    }
                                    }
                                    .frame(maxWidth: .infinity)
                                    
                                }
                                .onAppear {
                                    if viewModel.isSignedIn {
                                        Task {
                                            do {
                                                try await viewModel.loadCurrentUser()
                                            } catch {
                                                print("Error loading user: \(error)")
                                            }
                                        }
                                    }
                                }
                                
                                
                            } else {
                                // content when user is not signed in
                                
   
                                SignInButtons(refreshViewCallback: {
                                            self.refreshView.toggle()
                                        })

                            }
                        
                        Spacer()

                        
                        
                        // feedback - sticky
                        
                        Group {
                            
                            VStack(alignment: .leading, spacing: 8) {
                                Divider()

                                Button(action: {
                                    if let url = URL(string: "https://forms.gle/yH2XX9bd3LCYTUjP7") {
                                        UIApplication.shared.open(url, options: [:], completionHandler: nil)
                                    }
                                }) {
                                    Text("Send feedback >")
                                        .font(.custom("Poppins-Regular", size: 16))
                                        .foregroundColor(Color.teal)
                                    
                                }
                                Text("I'd love to hear if you have any feedback or suggestions for improvement. 🙏")
                                    .font(.custom("Poppins-Regular", size: 12))
                                    .foregroundColor(Color.gray)
                            }
                            Divider()
                            VStack(alignment: .leading, spacing: 8) {
                                Button(action: {
                                    if let appStoreURL = URL(string: "itms-apps://itunes.apple.com/gb/app/id6464316982?action=write-review&mt=8") {
                                        UIApplication.shared.open(appStoreURL, options: [:], completionHandler: nil)
                                    }
                                }) {
                                    Text("Leave a review >")
                                        .font(.custom("Poppins-Regular", size: 16))
                                        .foregroundColor(Color.teal)
                                    
                                }
                                Text("Your review on App Store would really help to support Tails.")
                                    .font(.custom("Poppins-Regular", size: 12))
                                    .foregroundColor(Color.gray)
                                
                            }
                            Divider()

                        }
                            
                        
                    }
                    .padding([.leading,.trailing], 16)

                
            }
            
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .onChange(of: authStateManager.isSignedIn) { _ in
                    refreshView.toggle()
                }
                .task {
                    try? await viewModel.loadCurrentUser()
                }
        
        .onAppear {
            Task {
                do {
                    let authDataResult = try AuthenticationManager.shared.getAuthenticatedUser()
                    
                    // Fetch user programs
                    let userPrograms = try await UserManager.shared.getUserPrograms(userId: authDataResult.uid)
                    
                    if let firstProgram = userPrograms.first(where: { $0.programId == 1 }) {
                                   programStatusFirst = firstProgram.status
                               }
                    if let leashProgram = userPrograms.first(where: { $0.programId == 2 }) {
                                   programStatusLeash = leashProgram.status
                               }
                    if let officeProgram = userPrograms.first(where: { $0.programId == 3 }) {
                                   programStatusOffice = officeProgram.status
                               }
                    
                    print("User has programs: \(userPrograms)")
                    
                } catch {
                    print("Error fetching user programs:", error.localizedDescription)
                }
            }
        }
    }
}

#Preview {
    ProfileView()
}
