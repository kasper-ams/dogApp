//
//  ProgramSheetRecall.swift
//  dogApp
//
//  Created by Kaspars Jelaiskis on 16/11/2023.
//

import SwiftUI

struct ProgramSheetRecall: View {
    @Environment(\.presentationMode) var presentationMode
    var bgColor = Color(red: 250.0/255.0, green: 250.0/255.0, blue: 250.0/255.0)
    
    @AppStorage("isRecallComplete") var isRecallComplete = false
    
    
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
                    
                    Image("Come")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding([.leading, .trailing], 16)
                    
                    if isRecallComplete {
                        
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
                    
                    Text("Recall")
                        .font(.custom("SignikaNegative-SemiBold", size: 24))
                        .padding(.leading, 16)
                    
                    VStack(alignment: .leading) {
                        Text("• Find a quiet spot with minimal distractions. We're talking about a low-key environment where your pup can focus on you. \n \n• Pick a recall word that suits your style. \"Come,\" \"Here,\" or \"Zoom!\"—whatever tickles your fancy. Just be consistent and stick with it. Dogs are geniuses, but they like routine too! \n \n• Arm yourself with your pup's favorite treats. Every time they rush to you on command, shower them with praise and goodies. \n \n• Once your pup nails the basics, up the ante. Add a sprinkle of distractions—maybe a squeaky toy or a friend playing fetch nearby. \n \nRecall time is not drill sergeant time. Keep it upbeat and playful. Wiggle that treat bag, throw in some excited jumps, and make coming to you the highlight of their day. ")
                            .font(.custom("Poppins-Regular", size: 16))
                        
                    }
                    
                    .padding([.leading, .trailing], 16)
                    
                    Spacer()
                   
                        GetNamesButton(text: "Mark as complete") {
                            isRecallComplete = true
                            presentationMode.wrappedValue.dismiss()
                        }
                        .padding()
                        .opacity(isRecallComplete ? 0 : 1)
                    }
                }
            }
            
        }
    }




#Preview {
    ProgramSheetRecall()
}
