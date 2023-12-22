//
//  ProgramSheetLeashQuiz.swift
//  dogApp
//
//  Created by Kaspars Jelaiskis on 22/11/2023.
//

import SwiftUI

struct ProgramSheetLeashQuiz: View {
    var bgColor = Color(red: 250.0/255.0, green: 250.0/255.0, blue: 250.0/255.0)
    @Environment(\.presentationMode) var presentationMode
    @AppStorage("isLeashQuizComplete") var isLeashQuizComplete = false
    @State private var isQuizButtonTrueTapped = false

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
            
            VStack(alignment: .leading, spacing: 16) {
                Spacer()
                    .frame(height: 48)
                if isLeashQuizComplete {
                    
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
                
                Text("What is the purpose of the \"stop-and-go\" technique in leash walking training?")
                    .font(.custom("SignikaNegative-SemiBold", size: 24))
                    .padding([.leading, .trailing], 16)
    
                
                VStack {
                    
                    QuizButtonFalse(text: "To encourage your dog to run ahead") {
                        return
                    }
                    
                    QuizButtonFalse(text: "To teach your dog to stop abruptly") {
                        return
                    }
                    
                    QuizButtonFalse(text: "To reward your dog for pulling on the leash") {
                        return
                    }
                    QuizButtonTrue(text: "To teach your dog that pulling results in no progress") {
                        isQuizButtonTrueTapped = true
                    }
                }
                .padding()
               Spacer()
                
                
                if isQuizButtonTrueTapped {
                    GetNamesButton(text: "Complete program") {
                        isLeashQuizComplete = true
                        presentationMode.wrappedValue.dismiss()
                    }
                    .padding()
                    .opacity(isLeashQuizComplete ? 0 : 1)
                }
                
            }
        }
    }
}

#Preview {
    ProgramSheetLeashQuiz()
}
