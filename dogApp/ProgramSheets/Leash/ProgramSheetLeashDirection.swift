//
//  ProgramSheetLeashDirection.swift
//  dogApp
//
//  Created by Kaspars Jelaiskis on 22/11/2023.
//

import SwiftUI

struct ProgramSheetLeashDirection: View {
    
    var bgColor = Color(red: 250.0/255.0, green: 250.0/255.0, blue: 250.0/255.0)
    @Environment(\.presentationMode) var presentationMode
    @AppStorage("isLeashDirectionComplete") var isLeashDirectionComplete = false

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
                    Image("directionChangeDetail")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding([.leading, .trailing], 16)
                    
                    if isLeashDirectionComplete {
                        
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
                    
                    Text("Direction change")
                        .font(.custom("SignikaNegative-SemiBold", size: 24))
                        .padding([.leading, .trailing], 16)
                    
                    Text("• Begin the training in a quiet environment with minimal distractions. A fenced yard or a quiet park can be suitable. \n \n• Start walking in a straight line with your dog beside or slightly behind you. Suddenly change direction by making a 90-degree turn to the left or right. Use a verbal cue to signal the change of the direction.  \n \n • As you turn, guide your dog with the leash to follow your lead. Use gentle pressure on the leash to guide them in the new direction. As your dog successfully changes direction with you, immediately reward them with treats and praise. \n \n• Practice direction changes in both left and right directions. As your dog becomes more proficient, gradually introduce distractions during your walks.")
                        .font(.custom("Poppins-Regular", size: 16))
                        .padding([.leading, .trailing], 16)
                    
                    GetNamesButton(text: "Mark as complete") {
                        isLeashDirectionComplete = true
                        presentationMode.wrappedValue.dismiss()
                    }
                    .padding()
                    .opacity(isLeashDirectionComplete ? 0 : 1)
                }
            }
        }
        
    }
}

#Preview {
    ProgramSheetLeashDirection()
}
