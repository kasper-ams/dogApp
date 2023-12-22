//
//  PlayViewTunnel.swift
//  dogApp
//
//  Created by Kaspars Jelaiskis on 30/09/2023.
//

import SwiftUI

struct PlayViewTunnel: View {
    @Environment(\.presentationMode) var presentationMode
    var bgColor = Color(red: 250.0/255.0, green: 250.0/255.0, blue: 250.0/255.0)
    
    @AppStorage("isTunnelFave") var isTunnelFave = false
    @StateObject var favoriteItems = FavoriteItems()
    
    var body: some View {
        
        ZStack(alignment: .topTrailing) {
            
            bgColor.ignoresSafeArea()
            
            HStack {
                FavoriteButton(isFavorite: $isTunnelFave)
             
                Spacer()
                
                CloseSheetButton {
                    presentationMode.wrappedValue.dismiss()
            
                }
            }
            .zIndex(3)
            
            ScrollView {
                
                VStack(alignment: .leading, spacing: 16) {
                    
                    Image("Tunnel")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding([.leading, .trailing], 16)
                    
                    Text("Tunnel")
                        .font(.custom("SignikaNegative-SemiBold", size: 24))
                        .padding(.leading, 16)
                    
                    VStack(alignment: .leading, spacing: 16) {
                        
                        Text("Depending in the size of the tunnel you may need to practice \"Crawl\" first.")
                        
                        Text("• Allow your dog to explore the tunnel and encourage them with treats. \n \n • Show a treat and toss it into the tunnel to entice your dog. \n \n • If needed, use a leash to guide them through, rewarding at the end. \n \n • Train in short, positive sessions. Add a command like \"tunnel\" for consistency. \n \n Over time, make the tunnel longer or introduce more complex routes.")
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
    PlayViewTunnel()
}
