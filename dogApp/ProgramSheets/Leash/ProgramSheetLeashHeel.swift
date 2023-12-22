//
//  ProgramSheetLeashHeel.swift
//  dogApp
//
//  Created by Kaspars Jelaiskis on 22/11/2023.
//

import SwiftUI

struct ProgramSheetLeashHeel: View {
    var bgColor = Color(red: 250.0/255.0, green: 250.0/255.0, blue: 250.0/255.0)
    @Environment(\.presentationMode) var presentationMode
    @AppStorage("isLeashHeelComplete") var isLeashHeelComplete = false

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
                    Image("heel")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding([.leading, .trailing], 16)
                    if isLeashHeelComplete {
                        
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
                    Text("Heel")
                        .font(.custom("SignikaNegative-SemiBold", size: 24))
                        .padding([.leading, .trailing], 16)
                    
                    Text("• Begin walking your dog with a loose leash, allowing them some freedom. Use a clear and consistent verbal cue, such as \"Heel,\" when you want your dog to walk by your side.\n \n• Reward your dog with treats and praise when they are in the desired heel position, walking closely by your side. Use a clicker or a verbal marker to signal the precise moment they are in the correct position. \n \n • Gradually introduce changes in direction during the walk, and encourage your dog to follow your lead. Reward them for adjusting their position accordingly.")
                        .font(.custom("Poppins-Regular", size: 16))
                        .padding([.leading, .trailing], 16)
                    
                    GetNamesButton(text: "Mark as complete") {
                        isLeashHeelComplete = true
                        presentationMode.wrappedValue.dismiss()
                    }
                    .padding()
                    .opacity(isLeashHeelComplete ? 0 : 1)
                }
            }
        }
    }
}

#Preview {
    ProgramSheetLeashHeel()
}
