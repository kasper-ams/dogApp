//
//  ProgramSheetEyeContact.swift
//  dogApp
//
//  Created by Kaspars Jelaiskis on 16/11/2023.
//

import SwiftUI

struct ProgramSheetEyeContact: View {
    @Environment(\.presentationMode) var presentationMode
    @AppStorage("isEyeContactComplete") var isEyeContactComplete = false
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
                    
                    Image("Look")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding([.leading, .trailing], 16)
                    
                    if isEyeContactComplete {
                        
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
                        
                    Text("Eye contact")
                        .font(.custom("SignikaNegative-SemiBold", size: 24))
                        .padding(.leading, 16)
                    
                    VStack(alignment: .leading) {
                        
                        Text("This is a useful command to practice as it reinforces your dog to pay attention to you.\n\n• Choose a simple word or phrase like \"watch me\" or \"look at me\". This will serve as the command you use to instruct your dog to make eye contact with you. \n \n • Hold a treat up near your face to get their attention. \n \n • When you give the cue (e.g., \"watch me\"), wait for your dog to make eye contact with you. As soon as they do, immediately reward them with the treat and offer verbal praise. \n\nIncorporate the eye contact command into your daily interactions. Use it before meals, during walks, or when you're simply hanging out together. This builds a habit of checking in and connecting on a deeper level.")
                            .font(.custom("Poppins-Regular", size: 16))
                        
                    }
                    
                    .padding([.leading, .trailing], 16)
                    
                    Spacer()
                    
                   
                        
                  
                        GetNamesButton(text: "Mark as complete") {
                            isEyeContactComplete = true
                            presentationMode.wrappedValue.dismiss()
                        }
                        .padding()
                        .opacity(isEyeContactComplete ? 0 : 1)
                    }
                }
            }
            
        }
           
    }

#Preview {
    ProgramSheetEyeContact()
}
