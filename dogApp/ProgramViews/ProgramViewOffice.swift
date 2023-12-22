//
//  ProgramViewOffice.swift
//  dogApp
//
//  Created by Kaspars Jelaiskis on 16/12/2023.
//

import SwiftUI

enum ProgramStatusOffice: String {
    case notStarted
    case inProgress
    case completed
}

struct ProgramViewOffice: View {
    
    let colorTop = Color(red: 0.54, green: 0.55, blue: 0.86)
    let colorBottom = Color(red: 0.45, green: 0.47, blue: 0.83)
    let activeColor = Color(red: 0, green: 0.43, blue: 0.47)
    let bgColor = Color(red: 250.0/255.0, green: 250.0/255.0, blue: 250.0/255.0)
    
    @State private var programSheetOfficeDesensitization = false
    @State private var programSheetOfficePlace = false
    @State private var programSheetOfficeGreet = false
    @State private var programSheetOfficeSpace = false
    @State private var programSheetOfficeSocial = false
    @State private var programSheetOfficeQuiz = false

    @AppStorage("isOfficeDesensitizationComplete") var isOfficeDesensitizationComplete = false
    @AppStorage("isOfficePlaceComplete") var isOfficePlaceComplete = false
    @AppStorage("isOfficeGreetComplete") var isOfficeGreetComplete = false
    @AppStorage("isOfficeSpaceComplete") var isOfficeSpaceComplete = false
    @AppStorage("isOfficeSocialComplete") var isOfficeSocialComplete = false
    @AppStorage("isOfficeQuizComplete") var isOfficeQuizComplete = false
//
    @AppStorage("OfficeButtonLabel") var officeButtonLabel = "Enroll"
    
    @AppStorage("programStatusOffice") var programStatusOffice = ProgramStatusOffice.notStarted.rawValue

    // Helper function to determine the active task
    func activeTask() -> String {
        if !isOfficeDesensitizationComplete {
            return "Office Desensitization"
        } else if !isOfficePlaceComplete {
            return "Place"
        } else if !isOfficeGreetComplete {
            return "Greet politey"
        } else if !isOfficeSpaceComplete {
            return "Safe space"
        } else if !isOfficeSocialComplete {
            return "Socialization"
        } else if !isOfficeQuizComplete {
            return "Quiz"
        } else {
            return "AllTasksCompleted"
        }
    }
    
    
    var body: some View {
      
        ZStack(alignment: .topTrailing) {
            
            bgColor.ignoresSafeArea()
            
            NavigationView {
                
                ScrollView {
                    
                    VStack(spacing: -8) {
                        
                        //header
                        ZStack {
                            RoundedRectangle(cornerRadius: 0)
                                .fill(LinearGradient(colors: [colorTop, colorBottom], startPoint: .top, endPoint: .bottom))
                                .frame(width: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, height: 164)
                                
                                
                            
                            HStack(alignment: .bottom) {
                                VStack(alignment: .leading) {
                                    if programStatusOffice == ProgramStatusOffice.inProgress.rawValue {
                                        Text("In progress")
                                            .font(.custom("SignikaNegative-SemiBold", size: 16))
                                            .foregroundColor(.white)
                                            .padding(.bottom, 32)
                                    }
                                    Text("Office training")
                                        .font(.custom("SignikaNegative-SemiBold", size: 24))
                                        .foregroundColor(.white)
                                }
                                Spacer()
                                
                                Image("office")
                                    .resizable()
                                    .frame(width: 100, height: 100)
                                    .mask(Circle())
                                    .overlay(Circle()
                                        .stroke(Color.white, lineWidth: 4))
                            }
                            .padding(24)
                        }
                        
                        //content
                        
                        ZStack {
                            RoundedRectangle(cornerRadius: 8)
                                .fill(Color .white)
                                
                                
                            VStack(alignment: .leading, spacing: 24) {
                                
                                if isOfficeDesensitizationComplete && isOfficePlaceComplete && isOfficeSpaceComplete && isOfficeSocialComplete  && isOfficeQuizComplete {
                                    ZStack(alignment: .leading) {
                                        RoundedRectangle(cornerRadius: 8)
                                            .fill(Color(red: 0.91, green: 1, blue: 0.94))
                                            .frame(width: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, height: 36)
                                        VStack(alignment: .leading) {
                                            HStack(alignment: .center, spacing: 2) {
                                                Image(systemName: "checkmark.seal")
                                                    .foregroundColor(.green)
                                                Text("Program completed!")
                                                    .font(.custom("Poppins-Medium", size: 16))
                                                    .foregroundColor(.green)
                                                
                                            }
                                            .padding()
                                
                                            
                                            //reset button
//                                                Button(action: {
//                                                    isOfficeDesensitizationComplete = false
//                                                    isOfficePlaceComplete = false
//                                                    isOfficeGreetComplete = false
//                                                    isOfficeSpaceComplete = false
//                                                    isOfficeSocialComplete = false
//                                                    isOfficeQuizComplete = false
//                                                    programStatusOffice = ProgramStatusOffice.notStarted.rawValue
//                                                    print(programStatusOffice)
//                                                }, label: {
//                                                    Text("Reset")
//                                                })
                                        }
                                    }
                                 
                                }
                                
                                
                                
                                Text("Bringing your dog to office can be stressful for you both. Follow this program and handle it like a pro.")
                                    .font(.custom("Poppins-Regular", size: 16))
                                    .lineLimit(nil)
                                    .fixedSize(horizontal: false, vertical: true)
                                
                                
                                Text("Curriculum")
                                    .font(.custom("SignikaNegative-SemiBold", size: 18))
                                
                                //list of items
                                VStack(alignment: .leading, spacing: 12) {
                                    
                                    Button(action: {
                                        if isOfficeDesensitizationComplete || isOfficePlaceComplete /*|| isLeashDirectionComplete || isLeashLooseComplete*/ {
                                            programSheetOfficeDesensitization.toggle()
                                        }
                                    }) {
                                        HStack {
                                            Image(systemName: isOfficeDesensitizationComplete ? "checkmark" : "circle")
                                                .foregroundColor(isOfficeDesensitizationComplete ? .black : activeColor)
                                            Text("Office desensitization")
                                                .font(Font.custom("Poppins", size: 16))
                                                .foregroundColor(isOfficeDesensitizationComplete ? .black : activeColor)
                                        }
                                    }
                                    Divider()
                                    Button(action: {
                                        if isOfficeDesensitizationComplete || isOfficePlaceComplete {
                                            programSheetOfficePlace.toggle()
                                        }
                                    }) {
                                        HStack {
                                            Image(systemName: isOfficePlaceComplete ? "checkmark" : (isOfficeDesensitizationComplete ? "circle" : "lock"))
                                                .foregroundColor(isOfficePlaceComplete ? .black : (isOfficeDesensitizationComplete ? activeColor : .gray))
                                            Text("Place")
                                                .font(Font.custom("Poppins", size: 16))
                                                .foregroundColor(isOfficePlaceComplete ? .black : (isOfficeDesensitizationComplete ? activeColor : .gray))
                                        }
                                    }
                                    Divider()
                                    
                                    Button(action: {
                                        if isOfficePlaceComplete || isOfficeGreetComplete  {
                                            programSheetOfficeGreet.toggle()
                                        }
                                    }) {
                                        HStack {
                                            Image(systemName: isOfficeGreetComplete ? "checkmark" : (isOfficePlaceComplete ? "circle" : "lock"))
                                                .foregroundColor(isOfficeGreetComplete ? .black : (isOfficePlaceComplete ? activeColor : .gray))
                                            Text("Greet politely")
                                                .font(Font.custom("Poppins", size: 16))
                                                .foregroundColor(isOfficeGreetComplete ? .black : (isOfficePlaceComplete ? activeColor : .gray))
                                        }
                                    }
                                    
                                    
                                    Divider()
                                    
                                    Button(action: {
                                        if isOfficeGreetComplete   {
                                            programSheetOfficeSpace.toggle()
                                        }
                                    }) {
                                        HStack {
                                            Image(systemName: isOfficeSpaceComplete ? "checkmark" : (isOfficeGreetComplete ? "circle" : "lock"))
                                                .foregroundColor(isOfficeSpaceComplete ? .black : (isOfficeGreetComplete ? activeColor : .gray))
                                            Text("Safe space")
                                                .font(Font.custom("Poppins", size: 16))
                                                .foregroundColor(isOfficeSpaceComplete ? .black : (isOfficeGreetComplete ? activeColor : .gray))
                                        }
                                    }
                                    
                                    Divider()
                             
                                    Button(action: {
                                        if isOfficeSpaceComplete   {
                                            programSheetOfficeSocial.toggle()
                                        }
                                    }) {
                                        HStack {
                                            Image(systemName: isOfficeSocialComplete ? "checkmark" : (isOfficeSpaceComplete ? "circle" : "lock"))
                                                .foregroundColor(isOfficeSocialComplete ? .black : (isOfficeSpaceComplete ? activeColor : .gray))
                                            Text("Socialization")
                                                .font(Font.custom("Poppins", size: 16))
                                                .foregroundColor(isOfficeSocialComplete ? .black : (isOfficeSpaceComplete ? activeColor : .gray))
                                        }
                                    }
                                    
                                    Divider()
                                    
                                    Button(action: {
                                        if isOfficeSocialComplete   {
                                            programSheetOfficeQuiz.toggle()
                                        }
                                    }) {
                                        HStack {
                                            Image(systemName: isOfficeQuizComplete ? "checkmark" : (isOfficeSocialComplete ? "circle" : "lock"))
                                                .foregroundColor(isOfficeQuizComplete ? .black : (isOfficeSocialComplete ? activeColor : .gray))
                                            Text("Quiz")
                                                .font(Font.custom("Poppins", size: 16))
                                                .foregroundColor(isOfficeQuizComplete ? .black : (isOfficeSocialComplete ? activeColor : .gray))
                                        }
                                    }
                                }
                                
                               
                                
                                Spacer()
                                
                                
                                //main button
                                ZStack {
                                    GetNamesButton(text: officeButtonLabel) {
                                        switch activeTask() {
                                        case "Office Desensitization":
                                            programSheetOfficeDesensitization.toggle()
                                        case "Place":
                                            programSheetOfficePlace.toggle()
                                        case "Safe space":
                                            programSheetOfficeSpace.toggle()
                                        case "Greet politey":
                                            programSheetOfficeGreet.toggle()
                                        case "Socialization":
                                            programSheetOfficeSocial.toggle()
                                        case "Quiz":
                                            programSheetOfficeQuiz.toggle()
                                        default:
                                            Text("All done!")
                                            
                                        }
                                        officeButtonLabel = "Continue"
                                        programStatusOffice = ProgramStatusOffice.inProgress.rawValue
                                        print(programStatusOffice)
                                    }
                                    .opacity(isOfficeDesensitizationComplete && isOfficePlaceComplete && isOfficeSpaceComplete && isOfficeSocialComplete  && isOfficeQuizComplete ? 0 : 1)
                                    
                                    
                                }
                                
                                
                            }
                            .padding()
                            
                            
                        }
                        
                    }
                }
        }
            .navigationViewStyle(StackNavigationViewStyle())
            
            
    }
        .sheet(isPresented: $programSheetOfficeDesensitization) {
            ProgramSheetOfficeDesensitization()
        }
        .sheet(isPresented: $programSheetOfficePlace) {
            ProgramSheetOfficePlace()
        }
        .sheet(isPresented: $programSheetOfficeGreet) {
            ProgramSheetOfficeGreet()
        }
        .sheet(isPresented: $programSheetOfficeSpace) {
            ProgramSheetOfficeSpace()
        }
        .sheet(isPresented: $programSheetOfficeSocial) {
            ProgramSheetOfficeSocialization()
        }
        .sheet(isPresented: $programSheetOfficeQuiz) {
            ProgramSheetOfficeQuiz()
                .onDisappear {
                    if isOfficeQuizComplete {
                        programStatusOffice = ProgramStatusOffice.completed.rawValue
                        print(programStatusOffice)
                    }
                }
        }
    }
}

#Preview {
    ProgramViewOffice()
}
