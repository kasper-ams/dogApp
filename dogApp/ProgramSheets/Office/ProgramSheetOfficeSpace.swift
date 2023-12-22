//
//  ProgramSheetOfficeSpace.swift
//  dogApp
//
//  Created by Kaspars Jelaiskis on 18/12/2023.
//

import SwiftUI

struct ProgramSheetOfficeSpace: View {
    let bgColor = Color(red: 250.0/255.0, green: 250.0/255.0, blue: 250.0/255.0)
    @Environment(\.presentationMode) var presentationMode
    @AppStorage("isOfficeSpaceComplete") var isOfficeSpaceComplete = false

    
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
                    
                    Image("inOffice")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding([.leading, .trailing], 16)
                    
                    if isOfficeSpaceComplete {
                        
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
                    
                    Text("Safe space")
                        .font(.custom("SignikaNegative-SemiBold", size: 24))
                        .padding(.leading, 16)
                    
                    VStack(alignment: .leading, spacing: 16) {
                        
                        
                        ZStack(alignment: .leading) {
                            RoundedRectangle(cornerRadius: 4)
                                .fill(.thickMaterial)
                                //.frame(height: 28)
                            Text("Creating a comfortable space for your dog in an office environment is important to help them feel secure and relaxed.")
                                .font(.custom("Poppins-Regular", size: 14))
                                .foregroundColor(.gray)
                                .padding(10)
                        }
                       
                        Text("• Provide a comfortable bed or mat for your dog to lie on. Choose a bed that offers adequate support and is large enough for them to stretch out comfortably. \n \n • Bring in familiar items from home, such as your dog's favorite blanket or toy. Having familiar scents around can help your dog feel more at ease in the new environment. \n \n • Choose a quiet and relatively secluded area for your dog's space. This helps minimize distractions and allows your dog to relax without being constantly stimulated by the surrounding activity. \n \n • Always have a clean water bowl available for your dog. Hydration is crucial, especially if they spend extended periods in the office. \n \n • Provide a selection of toys and chewables to keep your dog entertained during quiet moments. Interactive toys that dispense treats can be particularly engaging. \n \n • Schedule regular breaks for your dog to stretch their legs, go for short walks, and have bathroom breaks. Regular breaks help prevent restlessness and promote overall well-being.")
                            .font(.custom("Poppins-Regular", size: 16))
                    }
                    
                    .padding([.leading, .trailing], 16)
                    
                    GetNamesButton(text: "Mark as complete") {
                        isOfficeSpaceComplete = true
                        presentationMode.wrappedValue.dismiss()
                    }
                    .padding()
                    .opacity(isOfficeSpaceComplete ? 0 : 1)
                }
            }
        }
    }
}

#Preview {
    ProgramSheetOfficeSpace()
}
