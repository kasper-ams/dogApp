//
//  ProgramSheetStay.swift
//  dogApp
//
//  Created by Kaspars Jelaiskis on 16/11/2023.
//

import SwiftUI

struct ProgramSheetStay: View {
    @Environment(\.presentationMode) var presentationMode
    @AppStorage("isStayComplete") var isStayComplete = false
    var bgColor = Color(red: 250.0/255.0, green: 250.0/255.0, blue: 250.0/255.0)

    
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
                    
                    Image("Stay")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding([.leading, .trailing], 16)
                    
                    if isStayComplete {
                        
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
                        
                    Text("Stay")
                        .font(.custom("SignikaNegative-SemiBold", size: 24))
                        .padding(.leading, 16)
                    
                    VStack(alignment: .leading) {
                        Text("• Begin in a neutral, quiet space. Select a clear and simple cue for 'Stay.' It could be \"Stay,\" \"Hold,\" or \"Wait.\"  \n \n• Start with short intervals. Ask your pup to 'stay' for a few seconds, then gradually increase the duration as they get the hang of it.  \n \n• If your pup breaks the 'Stay' prematurely, no worries! Gently guide them back to the original spot and try again. Positive reinforcement and a calm demeanor work wonders.\n \n• Celebrate the victories, no matter how small. When your pup nails the 'Stay,' reward them with treats and genuine praise. Reinforce the idea that staying put comes with its perks.\n \nApply 'Stay' in practical scenarios. Use it before crossing the street, at the vet's office, or when guests arrive. The versatility of the command makes it a valuable tool in various situations.")
                            .font(.custom("Poppins-Regular", size: 16))
                        
                    }
                    
                    .padding([.leading, .trailing], 16)
                    
                    Spacer()
                    
                  
                        
                   
                        GetNamesButton(text: "Mark as complete") {
                            isStayComplete = true
                            presentationMode.wrappedValue.dismiss()
                        }
                        .padding()
                        .opacity(isStayComplete ? 0 : 1)

                    }
                }
            }
            
        }
        
    }


#Preview {
    ProgramSheetStay()
}
