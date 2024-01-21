//
//  ProgramSheetOfficeQuiz.swift
//  dogApp
//
//  Created by Kaspars Jelaiskis on 19/12/2023.
//

import SwiftUI

struct ProgramSheetOfficeQuiz: View {
    
    var bgColor = Color(red: 250.0/255.0, green: 250.0/255.0, blue: 250.0/255.0)
    @Environment(\.presentationMode) var presentationMode
    @State private var isQuizButtonTrueTapped = false
    @State private var isProgramCompleteButtonVisible = false
    @State private var isOfficeQuizComplete = false
    let program: ProgramStructure
    
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
                if isOfficeQuizComplete {
                    
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
                
                Text("What is the purpose of creating a comfortable space for a dog in the office environment?")
                    .font(.custom("SignikaNegative-SemiBold", size: 24))
                    .padding([.leading, .trailing], 16)
    
                
                VStack {
                    
                    QuizButtonFalse(text: "To confine the dog and limit its movements") {
                        return
                    }
                    QuizButtonTrue(text: "To help the dog relax and feel secure") {
                        isQuizButtonTrueTapped = true
                        isProgramCompleteButtonVisible = true
                    }
                    
                    QuizButtonFalse(text: "To prevent the dog from interacting with colleagues") {
                        return
                    }
                    
                    QuizButtonFalse(text: "To provide a designated area for aggressive behavior") {
                        return
                    }
                }
                .padding()
               Spacer()
                
                
                if isProgramCompleteButtonVisible {
                    GetNamesButton(text: "Complete program") {
                        isOfficeQuizComplete = true
                        UserManager.shared.completeUserProgram(programId: program.id)
                        presentationMode.wrappedValue.dismiss()
                    }
                    .padding()
                    .opacity(isOfficeQuizComplete ? 0 : 1)
                }
                
            }
        }
    }
}

#Preview {
    ProgramSheetOfficeQuiz(program: ProgramStructure(id: 3, title: "String?", status: "String?", image: "puppy"))
}
