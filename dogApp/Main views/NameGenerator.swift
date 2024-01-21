//
//  NameGenerator.swift
//  dogApp
//
//  Created by Kaspars Jelaiskis on 09/09/2023.
//

import SwiftUI

struct NameGenerator: View {
    @StateObject private var viewModel = ProgramViewModel()

    @State private var generatedName: String? = nil
    @State var selectedGenderMale: Bool = true
    @State var selectedGenderFemale: Bool = true
    let bgColor = Color(red: 250.0/255.0, green: 250.0/255.0, blue: 250.0/255.0)
    
    
    var body: some View {
        ZStack {
            bgColor.ignoresSafeArea()
            
            VStack(alignment: .leading, spacing: 16) {
                
                Text("Dog name generator")
                    .font(.custom("SignikaNegative-SemiBold", size: 24))
                
                Text("A magical name roulette for your furry buddy. Just tap, and voila, you've got a tail-wagging, bark-worthy name suggestion for your four-legged pal!")
                    .font(.custom("Poppins-Regular", size: 16))
                
                Spacer()
                //swithcers
                
                HStack {
                    Switcher(text: "Male", state: $selectedGenderMale)
                    Switcher(text: "Female", state: $selectedGenderFemale)
                }
                
                
                //name
                ZStack {
                    RoundedRectangle(cornerRadius: 8)
                        .fill(Color(red: 239/255, green: 239/255, blue: 239/255))
                        .frame(maxWidth: .infinity, maxHeight: 88)
                    Text(generatedName ?? "Leo")
                        .font(.custom("SignikaNegative-SemiBold", size: 24))
                    
                }
                
                Spacer()
                
                //button
                
                
                GetNamesButton(text: "Generate name", action: {
                    getName()
                    func getName() {
                        
                        if selectedGenderMale && selectedGenderFemale == false {
                            generatedName = dogNames().randomMaleName()
                        }
                        
                        else if selectedGenderMale == false && selectedGenderFemale {
                            generatedName = dogNames().randomFemaleName()
                        }
                        
                        else {
                            generatedName = dogNames().randomName()
                        }
                       
                        
                    }
                    
                })
                
                
                
            }
            .padding(16)
        }
    }
}



struct NameGenerator_Previews: PreviewProvider {
    static var previews: some View {
        NameGenerator()
    }
}
