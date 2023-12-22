//
//  PlayViewFrisbee.swift
//  dogApp
//
//  Created by Kaspars Jelaiskis on 17/09/2023.
//

import SwiftUI

struct PlayViewFrisbee: View {
    @Environment(\.presentationMode) var presentationMode

    var bgColor = Color(red: 250.0/255.0, green: 250.0/255.0, blue: 250.0/255.0)
    @AppStorage("isFrisbeeFave") var isFrisbeeFave = false
    @StateObject var favoriteItems = FavoriteItems()
    
    var body: some View {
        
     
        ZStack(alignment: .topTrailing) {
            
                bgColor.ignoresSafeArea()
            
            HStack {
                FavoriteButton(isFavorite: $isFrisbeeFave)
             
                Spacer()
                
                CloseSheetButton {
                    presentationMode.wrappedValue.dismiss()
            
                }
            }
            .zIndex(3)
            
            
                ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    
                    Image("frisbee")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding([.leading, .trailing], 16)
                    
                    Text("Catch frisbee")
                        .font(.custom("SignikaNegative-SemiBold", size: 24))
                        .padding(.leading, 16)
                    
                    VStack(alignment: .leading, spacing: 16) {
                        
                        Group {
                            Text("Start with a Soft Frisbee")
                                .font(.headline)
                            
                            Text("Get a soft frisbee made for dogs. They're easier on their mouths.")
                                .font(.custom("Poppins-Regular", size: 16))
                            
                            Text("Get Your Dog Excited")
                                .font(.headline)
                            
                            Text("Show your dog the frisbee and get them all excited about it. Make it look like the coolest thing ever.")
                                .font(.custom("Poppins-Regular", size: 16))
                            
                            Text("Short Throws")
                                .font(.headline)
                            
                            Text("Begin with short, gentle throws close to your dog. Let them see it in the air and catch it. Praise them like crazy when they do!")
                                .font(.custom("Poppins-Regular", size: 16))
                            
                            Text("Practice")
                                .font(.headline)
                            
                            Text("Keep tossing the frisbee a bit farther each time as your pup gets better.")
                                .font(.custom("Poppins-Regular", size: 16))
                            
                            Text("Use Treats")
                                .font(.headline)
                            
                            Text("Reward them with treats and praise when they catch it. Dogs love treats, and it makes them want to catch that frisbee even more.")
                                .font(.custom("Poppins-Regular", size: 16))
                        }
                        
                        Text("Stay Patient")
                            .font(.headline)
                        
                        Text("Some dogs catch on quick, and some take a bit longer. Be patient and keep the practice sessions fun.")
                            .font(.custom("Poppins-Regular", size: 16))
                        
                        Text("Safety First")
                            .font(.headline)
                        
                        Text("Watch out for sharp turns and hard landings, especially on concrete or asphalt. Dogs can hurt themselves if they're not careful.")
                            .font(.custom("Poppins-Regular", size: 16))
                        
                    }
                    .padding([.leading, .trailing], 16)
                    
                    Spacer()
                }
            }
        }
    }
}

struct PlayViewFrisbee_Previews: PreviewProvider {
    static var previews: some View {
        PlayViewFrisbee()
    }
}
