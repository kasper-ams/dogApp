//
//  TrickViewCrawl.swift
//  dogApp
//
//  Created by Kaspars Jelaiskis on 30/09/2023.
//

import SwiftUI

struct TrickViewCrawl: View {
    @Environment(\.presentationMode) var presentationMode
    var bgColor = Color(red: 250.0/255.0, green: 250.0/255.0, blue: 250.0/255.0)
    @AppStorage("isCrawlFave") var isCrawlFave = false
    @StateObject var favoriteItems = FavoriteItems()
    
    var body: some View {
        
        ZStack(alignment: .topTrailing) {
            
            bgColor.ignoresSafeArea()
            
            HStack {
                FavoriteButton(isFavorite: $isCrawlFave)
             
                Spacer()
                
                CloseSheetButton {
                    presentationMode.wrappedValue.dismiss()
            
                }
            }
            .zIndex(3)
            
            ScrollView {
                
                VStack(alignment: .leading, spacing: 16) {
                    
                    Image("Crawl")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding([.leading, .trailing], 16)
                    
                    Text("Crawl")
                        .font(.custom("SignikaNegative-SemiBold", size: 24))
                        .padding(.leading, 16)
                    
                    VStack(alignment: .leading, spacing: 16) {
                        
                        ZStack(alignment: .leading) {
                            RoundedRectangle(cornerRadius: 4)
                                .fill(.thickMaterial)
                                .frame(height: 28)
                            Text("Requirements: command \"Lie down\"")
                                .font(.custom("Poppins-Regular", size: 14))
                                .foregroundColor(.gray)
                                .padding(.leading, 16)
                                
                        }
                        
                        Text("• Start with command \"down\" in a quiet place. \n \n • Hold a treat close to their nose, but don't let them have it just yet. \n \n • Use a cue like \"crawl\" or \"sneak\" (or any fun word you like), and slowly move the treat along the ground, just out of their reach. \n \n • As they follow the treat, they'll naturally start to crawl When they do, reward them with the treat and lots of praise!")
                            .font(.custom("Poppins-Regular", size: 16))
            
                        
                        
                 
                        
                     
                    }
                    
                    .padding([.leading, .trailing], 16)
                    
                    Spacer()
                }
            }
        }
    }
}

#Preview {
    TrickViewCrawl()
}
