//
//  ProgramSheetLeashStartStop.swift
//  dogApp
//
//  Created by Kaspars Jelaiskis on 22/11/2023.
//

import SwiftUI

struct ProgramSheetLeashStartStop: View {
    
    var bgColor = Color(red: 250.0/255.0, green: 250.0/255.0, blue: 250.0/255.0)
    @Environment(\.presentationMode) var presentationMode
    @AppStorage("isLeashStartStopComplete") var isLeashStartStopComplete = false
    
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
                    Image("leashWalkingDetail")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding([.leading, .trailing], 16)
                    
                    if isLeashStartStopComplete {
                        
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
                    
                    Text("Start and stop")
                        .font(.custom("SignikaNegative-SemiBold", size: 24))
                        .padding([.leading, .trailing], 16)
                    
                    Text("• Start with practicing indoors. Begin walking, and encourage your dog to follow you. Use a positive verbal cue such as \"Let's go\". \n \n• Come to a complete stop and stand still. Use a verbal cue such as \"Wait\" to indicate that the dog should stop walking. Reinforce the stopped behavior with treats. If your dog sits and waits patiently during the stop, continue to reward them for maintaining calm behavior. \n \n• When you're ready to start walking again, use your verbal cue, encourage your dog to start walking with you, and reward them for following your lead. \n \n • Repeat the start and stop sequences during your training session. Gradually increase the duration of stops and the distance covered during walks.")
                        .font(.custom("Poppins-Regular", size: 16))
                        .padding([.leading, .trailing], 16)
                    
                    
                    GetNamesButton(text: "Mark as complete") {
                        isLeashStartStopComplete = true
                        presentationMode.wrappedValue.dismiss()
                    }
                    .padding()
                    .opacity(isLeashStartStopComplete ? 0 : 1)
                }
            }
            
            
        }
    }
}

#Preview {
    ProgramSheetLeashStartStop()
}
