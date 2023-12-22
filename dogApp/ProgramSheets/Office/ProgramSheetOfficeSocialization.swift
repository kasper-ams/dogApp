//
//  ProgramSheetOfficeSocialization.swift
//  dogApp
//
//  Created by Kaspars Jelaiskis on 18/12/2023.
//

import SwiftUI

struct ProgramSheetOfficeSocialization: View {
    
    let bgColor = Color(red: 250.0/255.0, green: 250.0/255.0, blue: 250.0/255.0)
    @Environment(\.presentationMode) var presentationMode
    @AppStorage("isOfficeSocialComplete") var isOfficeSocialComplete = false
    
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
                    
                    Image("officeGreet")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding([.leading, .trailing], 16)
                    
                    if isOfficeSocialComplete {
                        
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
                    
                    Text("Socialization")
                        .font(.custom("SignikaNegative-SemiBold", size: 24))
                        .padding(.leading, 16)
                    
                    VStack(alignment: .leading, spacing: 16) {
                        
                        
                        ZStack(alignment: .leading) {
                            RoundedRectangle(cornerRadius: 4)
                                .fill(.thickMaterial)
                                //.frame(height: 28)
                            Text("Begin socializing your dog as early as possible, ideally during their puppyhood to build a foundation for positive behavior.")
                                .font(.custom("Poppins-Regular", size: 14))
                                .foregroundColor(.gray)
                                .padding(10)
                        }
                       
                        Text("• Introduce your dog gradually to different environments, people, and animals, starting with less challenging situations. \n \n • Provide opportunities for your dog to interact with other well-behaved dogs. This helps them develop appropriate social skills and learn how to communicate with others. \n \n • Well-socialized dogs are less likely to display aggressive behaviors towards other dogs. Positive interactions help reduce fear and anxiety, lowering the likelihood of defensive aggression. \n \n • Through interactions with other dogs, your dog learns to interpret and respond to social cues. This skill is valuable for preventing misunderstandings and conflicts in various social settings. \n \n • When introducing your dog to a new canine companion, do so in a supervised and controlled manner. Allow the dogs to sniff and greet each other gradually, observing their body language for signs of comfort or discomfort.")
                            .font(.custom("Poppins-Regular", size: 16))
                    }
                    
                    .padding([.leading, .trailing], 16)
                    
                    GetNamesButton(text: "Mark as complete") {
                        isOfficeSocialComplete = true
                        presentationMode.wrappedValue.dismiss()
                    }
                    .padding()
                    .opacity(isOfficeSocialComplete ? 0 : 1)
                }
            }
        }
    }
}

#Preview {
    ProgramSheetOfficeSocialization()
}
