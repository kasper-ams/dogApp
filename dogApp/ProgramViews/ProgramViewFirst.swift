//
//  ProgramViewFirst.swift
//  dogApp
//
//  Created by Kaspars Jelaiskis on 15/11/2023.
//

import SwiftUI
enum ProgramStatusFirst: String {
    case notStarted
    case inProgress
    case completed
}

struct ProgramViewFirst: View {
    
    let colorTop = Color(red: 1, green: 0.66, blue: 0.47)
    let colorBottom = Color(red: 1, green: 0.59, blue: 0.36)
    let activeColor = Color(red: 0, green: 0.43, blue: 0.47)
    let bgColor = Color(red: 250.0/255.0, green: 250.0/255.0, blue: 250.0/255.0)
    
    @State private var programSheetSit = false
    @State private var programSheetRecall = false
    @State private var programSheetStay = false
    @State private var programSheetEyeContact = false
    
    
    @AppStorage("isSitComplete") var isSitComplete = false
    @AppStorage("isRecallComplete") var isRecallComplete = false
    @AppStorage("isStayComplete") var isStayComplete = false
    @AppStorage("isEyeContactComplete") var isEyeContactComplete = false
    
    
    @AppStorage("firstButtonLabel") var firstButtonLabel = "Enroll"
    
    
    @AppStorage("programStatus") var programStatusFirst = ProgramStatusFirst.notStarted.rawValue
    
    
    // Helper function to determine the active task
    func activeTask() -> String {
        if !isSitComplete {
            return "Sit"
        } else if !isRecallComplete {
            return "Recall"
        } else if !isStayComplete {
            return "Stay"
        } else if !isEyeContactComplete {
            return "EyeContact"
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
                                    if programStatusFirst == ProgramStatusFirst.inProgress.rawValue {
                                        Text("In progress")
                                            .font(.custom("SignikaNegative-SemiBold", size: 16))
                                            .foregroundColor(.white)
                                            .padding(.bottom, 32)
                                    }
                                    Text("My first puppy")
                                        .font(.custom("SignikaNegative-SemiBold", size: 24))
                                        .foregroundColor(.white)
                                }
                                Spacer()
                                
                                Image("puppy")
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
                                
                                if isSitComplete && isRecallComplete && isStayComplete && isEyeContactComplete {
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
//                                                    isSitComplete = false
//                                                    isRecallComplete = false
//                                                    isStayComplete = false
//                                                    isEyeContactComplete = false
//                                                    programStatusFirst = ProgramStatusFirst.notStarted.rawValue
//                                                    print(programStatusFirst)
//                                                }, label: {
//                                                    Text("Reset")
//                                                })
                                        }
                                    }
                        
                                    
                                }
                                
                                
                                
                                Text("This program will teach you the essentials when getting started with your fist dog. You can build upon these foundations to teach more advanced commands.")
                                    .font(.custom("Poppins-Regular", size: 16))
                                    .lineLimit(nil)
                                    .fixedSize(horizontal: false, vertical: true)
                                
                                
                                Text("Curriculum")
                                    .font(.custom("SignikaNegative-SemiBold", size: 18))
                                
                                //list of items
                                VStack(alignment: .leading, spacing: 12) {
                                    
                                    Button(action: {
                                        if isSitComplete || isRecallComplete || isStayComplete || isEyeContactComplete {
                                            programSheetSit.toggle()
                                        }
                                    }) {
                                        HStack {
                                            Image(systemName: isSitComplete ? "checkmark" : "circle")
                                                .foregroundColor(isSitComplete ? .black : activeColor)
                                            Text("Sit")
                                                .font(Font.custom("Poppins", size: 16))
                                                .foregroundColor(isSitComplete ? .black : activeColor)
                                        }
                                    }
                                    Divider()
                                    Button(action: {
                                        if isRecallComplete || isSitComplete {
                                            programSheetRecall.toggle()
                                        }
                                    }) {
                                        HStack {
                                            Image(systemName: isRecallComplete ? "checkmark" : (isSitComplete ? "circle" : "lock"))
                                                .foregroundColor(isRecallComplete ? .black : (isSitComplete ? activeColor : .gray))
                                            Text("Recall")
                                                .font(Font.custom("Poppins", size: 16))
                                                .foregroundColor(isRecallComplete ? .black : (isSitComplete ? activeColor : .gray))
                                        }
                                    }
                                    Divider()
                                    
                                    Button(action: {
                                        if isStayComplete || isRecallComplete  {
                                            programSheetStay.toggle()
                                        }
                                    }) {
                                        HStack {
                                            Image(systemName: isStayComplete ? "checkmark" : (isRecallComplete ? "circle" : "lock"))
                                                .foregroundColor(isStayComplete ? .black : (isRecallComplete ? activeColor : .gray))
                                            Text("Stay")
                                                .font(Font.custom("Poppins", size: 16))
                                                .foregroundColor(isStayComplete ? .black : (isRecallComplete ? activeColor : .gray))
                                        }
                                    }
                                    
                                    
                                    Divider()
                                    
                                    Button(action: {
                                        if isStayComplete   {
                                            programSheetEyeContact.toggle()
                                        }
                                    }) {
                                        HStack {
                                            Image(systemName: isEyeContactComplete ? "checkmark" : (isStayComplete ? "circle" : "lock"))
                                                .foregroundColor(isEyeContactComplete ? .black : (isStayComplete ? activeColor : .gray))
                                            Text("Eye contact")
                                                .font(Font.custom("Poppins", size: 16))
                                                .foregroundColor(isEyeContactComplete ? .black : (isStayComplete ? activeColor : .gray))
                                        }
                                    }
                                    
                                }
                                
                                Spacer()
                                
                                
                                //main button
                                ZStack {
                                    GetNamesButton(text: firstButtonLabel) {
                                        switch activeTask() {
                                        case "Sit":
                                            programSheetSit.toggle()
                                        case "Recall":
                                            programSheetRecall.toggle()
                                        case "Stay":
                                            programSheetStay.toggle()
                                        case "EyeContact":
                                            programSheetEyeContact.toggle()
                                        default:
                                            Text("All done!")
                                            
                                        }
                                        firstButtonLabel = "Continue"
                                        programStatusFirst = ProgramStatusFirst.inProgress.rawValue
                                        print(programStatusFirst)
                                    }
                                    .opacity(isSitComplete && isRecallComplete && isStayComplete && isEyeContactComplete ? 0 : 1)
                                    
                                    
                                    
                                    
                                }
                                
                                
                            }
                            .padding()
                            
                            
                            
                        }
                        
                    }
                }
        }
            .navigationViewStyle(StackNavigationViewStyle())
            
            
    }
        .sheet(isPresented: $programSheetSit) {
            ProgramSheetSit()
        }
        .sheet(isPresented: $programSheetRecall) {
            ProgramSheetRecall()
        }
        .sheet(isPresented: $programSheetStay) {
            ProgramSheetStay()
        }
        .sheet(isPresented: $programSheetEyeContact) {
            ProgramSheetEyeContact()
                .onDisappear {
                    if isEyeContactComplete {
                        programStatusFirst = ProgramStatusFirst.completed.rawValue
                        print(programStatusFirst)
                    }
                }
        }
        
        
    }
    
}


#Preview {
    ProgramViewFirst()
}
