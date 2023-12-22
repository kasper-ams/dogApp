//
//  ProgramViewOfficePlace.swift
//  dogApp
//
//  Created by Kaspars Jelaiskis on 16/12/2023.
//

import SwiftUI

struct ProgramSheetOfficePlace: View {
    let bgColor = Color(red: 250.0/255.0, green: 250.0/255.0, blue: 250.0/255.0)
    @Environment(\.presentationMode) var presentationMode
    @AppStorage("isOfficePlaceComplete") var isOfficePlaceComplete = false

    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            
            bgColor.ignoresSafeArea()
            
            HStack {
            
                Spacer()
                CloseSheetButton {
                    presentationMode.wrappedValue.dismiss()
                }
            }
            .zIndex(3)
            
            ScrollView {
                
                VStack(alignment: .leading, spacing: 16) {
                    
                    Image("Place")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding([.leading, .trailing], 16)
                    
                    if isOfficePlaceComplete {
                        
                        ZStack(alignment: .leading) {
                            RoundedRectangle(cornerRadius: 8)
                                .fill(Color(red: 0.91, green: 1, blue: 0.94))
                                .frame(width: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, height: 36)
                            
                            HStack(alignment: .center, spacing: 2) {
                                Image(systemName: "checkmark")
                                    .foregroundColor(.green)
                                Text("Lesson completed!")
                                    .font(.custom("Poppins-Medium", size: 16))
                                    .foregroundColor(.green)
                            }
                            .padding(.leading, 16)
                        }
                        .padding()
                    }
                    
                    Text("Place")
                        .font(.custom("SignikaNegative-SemiBold", size: 24))
                        .padding(.leading, 16)
                    
                    VStack(alignment: .leading, spacing: 16) {
                        
                        
                        ZStack(alignment: .leading) {
                            RoundedRectangle(cornerRadius: 4)
                                .fill(.thickMaterial)
                                //.frame(height: 28)
                            Text("Teaching your dog to \"go to place\" is a handy command that can make your life easier. Follow these steps.")
                                .font(.custom("Poppins-Regular", size: 14))
                                .foregroundColor(.gray)
                                .padding(10)
                        }
                       
                        Text("• Choose a comfy spot for your dog to stay, like a dog bed or a designated area on the floor. \n \n • You'll need treats and a clicker (optional) for positive reinforcement. \n \n • Using a leash, stand by the chosen spot and say your command, like \"place\" or \"bed.\" \n \n • Use a treat to guide your dog onto the spot. Make sure they're fully on it before rewarding. \n \n • Click (if using a clicker) and treat immediately. Offer verbal praise like \"Good job!\" \n \n • Start waiting a few seconds before rewarding to build patience.")
                            .font(.custom("Poppins-Regular", size: 16))
                    }
                    
                    .padding([.leading, .trailing], 16)
                    
                    GetNamesButton(text: "Mark as complete") {
                        isOfficePlaceComplete = true
                        presentationMode.wrappedValue.dismiss()
                    }
                    .padding()
                    .opacity(isOfficePlaceComplete ? 0 : 1)
                }
            }
        }
    }
}

#Preview {
    ProgramSheetOfficePlace()
}
