//
//  ProgramSheetLeashLoose.swift
//  dogApp
//
//  Created by Kaspars Jelaiskis on 22/11/2023.
//

import SwiftUI

struct ProgramSheetLeashLoose: View {
    var bgColor = Color(red: 250.0/255.0, green: 250.0/255.0, blue: 250.0/255.0)
    @Environment(\.presentationMode) var presentationMode
    @AppStorage("isLeashLooseComplete") var isLeashLooseComplete = false

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
                    Image("looseLeash")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding([.leading, .trailing], 16)
                    if isLeashLooseComplete {
                        
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
                    
                    Text("Loose leash walking")
                        .font(.custom("SignikaNegative-SemiBold", size: 24))
                        .padding([.leading, .trailing], 16)
                    
                    Text("• Start by using a comfortable collar or harness and a standard leash. Have a supply of small, tasty treats that your dog loves.\n \n• Decide on which side you want your dog to walk (commonly, it's the left side).\n \n• Begin walking, and as soon as your dog starts to pull, come to a gentle stop. Wait for your dog to come back to your side and loosen the leash.Reward with a treat and resume walking when the leash is loose. \n \n• Occasionally change direction during the walk without warning. Reward your dog frequently for walking with a loose leash. Gradually reduce the frequency of treats as your dog becomes more consistent.")
                        .font(.custom("Poppins-Regular", size: 16))
                        .padding([.leading, .trailing], 16)
                    
                    GetNamesButton(text: "Mark as complete") {
                        isLeashLooseComplete = true
                        presentationMode.wrappedValue.dismiss()
                    }
                    .padding()
                    .opacity(isLeashLooseComplete ? 0 : 1)
                }
            }
        }
    }
}

#Preview {
    ProgramSheetLeashLoose()
}
