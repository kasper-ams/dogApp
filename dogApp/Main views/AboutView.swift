//
//  AboutView.swift
//  dogApp
//
//  Created by Kaspars Jelaiskis on 21/10/2023.
//

import SwiftUI

struct AboutView: View {
    let bgColor = Color(red: 250.0/255.0, green: 250.0/255.0, blue: 250.0/255.0)

    var body: some View {
        
        NavigationView {
            
            ZStack(alignment: .topLeading) {
                bgColor.ignoresSafeArea()
                
                ScrollView(showsIndicators: false) {
                    
                    VStack(alignment: .leading, spacing: 24) {
                        
                        Text("About Tails")
                            .font(.custom("SignikaNegative-SemiBold", size: 24))
                            .padding(.top, 24)
                        
                        VStack(alignment: .leading, spacing: 24) {
                            
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
                            
                            
                        }
                        
                        Spacer()
                    }
                    .padding(.leading, 16)
                }
             

                
                
            }
           
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

#Preview {
    AboutView()
}
