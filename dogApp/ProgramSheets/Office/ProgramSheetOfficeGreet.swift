//
//  ProgramSheetOfficeGreet.swift
//  dogApp
//
//  Created by Kaspars Jelaiskis on 17/12/2023.
//

import SwiftUI

struct ProgramSheetOfficeGreet: View {
    
    let bgColor = Color(red: 250.0/255.0, green: 250.0/255.0, blue: 250.0/255.0)
    @Environment(\.presentationMode) var presentationMode
    @AppStorage("isOfficeGreetComplete") var isOfficeGreetComplete = false
    
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
                    
                    Image("greetNicely")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding([.leading, .trailing], 16)
                    
                    if isOfficeGreetComplete {
                        
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
                    
                    Text("Greet politely")
                        .font(.custom("SignikaNegative-SemiBold", size: 24))
                        .padding(.leading, 16)
                    
                    VStack(alignment: .leading, spacing: 16) {
                        
                        
                        ZStack(alignment: .leading) {
                            RoundedRectangle(cornerRadius: 4)
                                .fill(.thickMaterial)
                                //.frame(height: 28)
                            Text("Dogs naturally express excitement and affection by jumping, but it's crucial to redirect this behavior in a way that is more acceptable for human interactions.")
                                .font(.custom("Poppins-Regular", size: 14))
                                .foregroundColor(.gray)
                                .padding(10)
                        }
                       
                        Text("• Ensure your dog has a solid understanding of basic commands such as sit, stay, and come. These commands will be the foundation for teaching polite greetings. \n \n • When your dog jumps up, avoid giving them attention. Turn away, fold your arms, and ignore them until they have all four paws on the ground. This teaches them that jumping results in a loss of attention. \n \n • Encourage your dog to sit when they approach people. Reward and praise them when they sit calmly. \n \n • Before guests or strangers approach, ask your dog to sit. If they sit, reward them. If they don't, use a leash or other control measures to prevent jumping and guide them into a sit position. \n \n • Train your dog to offer an alternative behavior when they're excited, such as holding a toy in their mouth. This can redirect their energy in a positive way. \n \n • Enlist the help of friends and family to practice polite greetings. Ask them to approach your dog calmly and reward the dog for sitting calmly rather than jumping.")
                            .font(.custom("Poppins-Regular", size: 16))
                    }
                    
                    .padding([.leading, .trailing], 16)
                    
                    GetNamesButton(text: "Mark as complete") {
                        isOfficeGreetComplete = true
                        presentationMode.wrappedValue.dismiss()
                    }
                    .padding()
                    .opacity(isOfficeGreetComplete ? 0 : 1)
                }
            }
        }
    }
}

#Preview {
    ProgramSheetOfficeGreet()
}
