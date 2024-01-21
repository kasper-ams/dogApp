//
//  ProfileView.swift
//  dogApp
//
//  Created by Kaspars Jelaiskis on 22/12/2023.
//

import SwiftUI

struct ProfileView: View {
    let bgColor = Color(red: 250.0/255.0, green: 250.0/255.0, blue: 250.0/255.0)
    
    @StateObject private var viewModel = ProfileViewModel()
    @Binding var showSignInView: Bool
    
    
    var body: some View {
        
        NavigationView {
            
            ZStack {
                bgColor.ignoresSafeArea()
                
                ScrollView(showsIndicators: false) {
                    
                    VStack(alignment: .leading, spacing: 24) {
                        
                        Text("My profile")
                            .font(.custom("SignikaNegative-SemiBold", size: 24))
                            .padding(.top, 24)
                        
                        if let user = viewModel.user {
                            Text("UserId: \(user.userId)")
                        }
                        
                        
                        
                        VStack(alignment: .leading, spacing: 24) {
                            
                            Divider()
                            
                            
                            VStack(alignment: .leading, spacing: 8) {
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
                        //button
                        
                        Spacer()
                        
                        HStack(alignment: .center) {
                            
                            Button(action: {
                                Task {
                                    do {
                                        try viewModel.signOut()
                                        showSignInView = true
                                    } catch {
                                        print(error)
                                    }
                                }
                            }) {
                                HStack {
                                    Image("signOut")
                                    Text("Sign out")
                                        .font(.custom("Poppins", size: 16))
                                    
                                    
                                }
                                .padding()
                                .cornerRadius(8)
                            }
                            .frame(maxWidth: .infinity)
                        }
                        
                    }
                    .padding([.leading,.trailing], 16)
                }
                
            }
            
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

#Preview {
    ProfileView(showSignInView: .constant(false))
}
