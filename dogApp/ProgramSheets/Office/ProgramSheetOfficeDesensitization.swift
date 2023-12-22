//
//  ProgramSheetOfficeDesensitization.swift
//  dogApp
//
//  Created by Kaspars Jelaiskis on 16/12/2023.
//

import SwiftUI

struct ProgramSheetOfficeDesensitization: View {
    
    var bgColor = Color(red: 250.0/255.0, green: 250.0/255.0, blue: 250.0/255.0)
    @Environment(\.presentationMode) var presentationMode
    @AppStorage("isOfficeDesensitizationComplete") var isOfficeDesensitizationComplete = false
    
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
                    Image("officeIntro")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding([.leading, .trailing], 16)
                    
                    if isOfficeDesensitizationComplete {
                        
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
                    
                    Text("Office desensitization")
                        .font(.custom("SignikaNegative-SemiBold", size: 24))
                        .padding([.leading, .trailing], 16)
                    
                    VStack(alignment: .leading, spacing: 16) {
                        ZStack(alignment: .leading) {
                            RoundedRectangle(cornerRadius: 4)
                                .fill(.thickMaterial)
                                //.frame(height: 28)
                            Text("Expose your dog to the sights, sounds, and smells of the office in a controlled and positive manner.")
                                .font(.custom("Poppins-Regular", size: 14))
                                .foregroundColor(.gray)
                                .padding(10)
                        }
                        
                        Text("• Start by bringing your dog to the office during off-hours when the environment is quieter. This allows your dog to explore and get used to the new surroundings without the added stress of a busy office. \n \n• Introduce your dog to the specific areas they'll be spending time in, such as your workspace or designated dog-friendly zones. Let them sniff around and get comfortable in these spaces. \n \n • If possible, introduce your dog to a few colleagues during the off-hours visits. Ensure that these interactions are positive and pleasant.\n \n• As your dog becomes more comfortable, gradually increase the duration of their visits during regular office hours. This helps them acclimate to the increased activity and noise levels. ")
                            .font(.custom("Poppins-Regular", size: 16))
                        
                    }
                    .padding([.leading, .trailing], 16)
                    
                   
                    
                    GetNamesButton(text: "Mark as complete") {
                        isOfficeDesensitizationComplete = true
                        presentationMode.wrappedValue.dismiss()
                    }
                    .padding()
                    .opacity(isOfficeDesensitizationComplete ? 0 : 1)
                }
            }
        }
    }
}

#Preview {
    ProgramSheetOfficeDesensitization()
}
