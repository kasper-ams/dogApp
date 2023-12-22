//
//  ProgramSheetSit.swift
//  dogApp
//
//  Created by Kaspars Jelaiskis on 15/11/2023.
//

import SwiftUI

struct ProgramSheetSit: View {
    @Environment(\.presentationMode) var presentationMode
    var bgColor = Color(red: 250.0/255.0, green: 250.0/255.0, blue: 250.0/255.0)
    @AppStorage("isSitComplete") var isSitComplete = false
    
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
                
                Image("Sit")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding([.leading, .trailing], 16)
                
                if isSitComplete {
                    
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
                
                Text("Sit")
                    .font(.custom("SignikaNegative-SemiBold", size: 24))
                    .padding(.leading, 16)
                
                VStack(alignment: .leading) {
                    Text("• Hold a treat close to your dog's nose. Move your hand upwards, causing their head to follow the treat. \n \n  • As their head moves up, their bottom will naturally lower into a sitting position. \n \n • Once they are sitting, say \"Sit\" and give them the treat.\n \nMake \'Sit\' a spontaneous event. Ask for a sit during playtime, before heading outside, or even when you just want to revel in their cuteness. Turning it into a fun surprise keeps your pup on their toes (or paws).")
                        .font(.custom("Poppins-Regular", size: 16))
                    
                }
                
                .padding([.leading, .trailing], 16)
                
                Spacer()
              
                    GetNamesButton(text: "Mark as complete") {
                        isSitComplete = true
                        presentationMode.wrappedValue.dismiss()
                    }
                    .padding()
                    .opacity(isSitComplete ? 0 : 1)
                }
            }
            
        }
    }


#Preview {
    ProgramSheetSit()
}
