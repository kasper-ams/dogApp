//
//  ProgramViewLeash.swift
//  dogApp
//
//  Created by Kaspars Jelaiskis on 22/11/2023.
//

import SwiftUI

enum ProgramStatusLeash: String {
    case notStarted
    case inProgress
    case completed
}

struct ProgramViewLeash: View {
    
    let colorTop = Color(red: 0.61, green: 0.79, blue: 0.86)
    let colorBottom = Color(red: 0.53, green: 0.75, blue: 0.83)
    let activeColor = Color(red: 0, green: 0.43, blue: 0.47)
    let bgColor = Color(red: 250.0/255.0, green: 250.0/255.0, blue: 250.0/255.0)

    @State private var programSheetLeashIntro = false
    @State private var programSheetLeashStartStop = false
    @State private var programSheetLeashDirection = false
    @State private var programSheetLeashLoose = false
    @State private var programSheetLeashHeel = false
    @State private var programSheetLeashQuiz = false


    @AppStorage("isLeashIntroComplete") var isLeashIntroComplete = false
    @AppStorage("isLeashStartStopComplete") var isLeashStartStopComplete = false
    @AppStorage("isLeashDirectionComplete") var isLeashDirectionComplete = false
    @AppStorage("isLeashLooseComplete") var isLeashLooseComplete = false
    @AppStorage("isLeashHeelComplete") var isLeashHeelComplete = false
    @AppStorage("isLeashQuizComplete") var isLeashQuizComplete = false

    @AppStorage("LeashButtonLabel") var leashButtonLabel = "Enroll"

    @AppStorage("programStatusLeash") var programStatusLeash = ProgramStatusLeash.notStarted.rawValue
    
    // Helper function to determine the active task
    func activeTask() -> String {
        if !isLeashIntroComplete {
            return "Leash and collar introduction"
        } else if !isLeashStartStopComplete {
            return "Start and stop"
        } else if !isLeashDirectionComplete {
            return "Direction change"
        } else if !isLeashLooseComplete {
            return "Loose leash walking"
        } else if !isLeashHeelComplete {
            return "Heel"
        } else if !isLeashQuizComplete {
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
                                    if programStatusLeash == ProgramStatusLeash.inProgress.rawValue {
                                        Text("In progress")
                                            .font(.custom("SignikaNegative-SemiBold", size: 16))
                                            .foregroundColor(.white)
                                            .padding(.bottom, 32)
                                    } 
                                    Text("Leash walking")
                                        .font(.custom("SignikaNegative-SemiBold", size: 24))
                                        .foregroundColor(.white)
                                }
                                Spacer()
                                
                                Image("leashWalking")
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
                                
                                if isLeashIntroComplete && isLeashStartStopComplete && isLeashDirectionComplete && isLeashLooseComplete && isLeashHeelComplete && isLeashQuizComplete {
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
//                                                    isLeashIntroComplete = false
//                                                    isLeashStartStopComplete = false
//                                                    isLeashDirectionComplete = false
//                                                    isLeashLooseComplete = false
//                                                    isLeashHeelComplete = false
//                                                    isLeashQuizComplete = false
//                                                    programStatusLeash = ProgramStatusLeash.notStarted.rawValue
//                                                    print(programStatusLeash)
//                                                }, label: {
//                                                    Text("Reset")
//                                                })
                                        }
                                    }
                        
                                    
                                }
                                
                                
                                
                                Text("Teaching a dog to walk on a leash is an important skill for both the dog and the owner. This program will help you achieve a well-behaved and leash-trained dog.")
                                    .font(.custom("Poppins-Regular", size: 16))
                                    .lineLimit(nil)
                                    .fixedSize(horizontal: false, vertical: true)
                                
                                
                                Text("Curriculum")
                                    .font(.custom("SignikaNegative-SemiBold", size: 18))
                                
                                //list of items
                                VStack(alignment: .leading, spacing: 12) {
                                    
                                    Button(action: {
                                        if isLeashIntroComplete || isLeashStartStopComplete || isLeashDirectionComplete || isLeashLooseComplete {
                                                programSheetLeashIntro.toggle()
                                        }
                                    }) {
                                        HStack {
                                            Image(systemName: isLeashIntroComplete ? "checkmark" : "circle")
                                                .foregroundColor(isLeashIntroComplete ? .black : activeColor)
                                            Text("Leash and collar introduction")
                                                .font(Font.custom("Poppins", size: 16))
                                                .foregroundColor(isLeashIntroComplete ? .black : activeColor)
                                        }
                                    }
                                    Divider()
                                    Button(action: {
                                        if isLeashStartStopComplete || isLeashIntroComplete {
                                            programSheetLeashStartStop.toggle()
                                        }
                                    }) {
                                        HStack {
                                            Image(systemName: isLeashStartStopComplete ? "checkmark" : (isLeashIntroComplete ? "circle" : "lock"))
                                                .foregroundColor(isLeashStartStopComplete ? .black : (isLeashIntroComplete ? activeColor : .gray))
                                            Text("Start and stop")
                                                .font(Font.custom("Poppins", size: 16))
                                                .foregroundColor(isLeashStartStopComplete ? .black : (isLeashIntroComplete ? activeColor : .gray))
                                        }
                                    }
                                    Divider()
                                    
                                    Button(action: {
                                        if isLeashDirectionComplete || isLeashStartStopComplete  {
                                            programSheetLeashDirection.toggle()
                                        }
                                    }) {
                                        HStack {
                                            Image(systemName: isLeashDirectionComplete ? "checkmark" : (isLeashStartStopComplete ? "circle" : "lock"))
                                                .foregroundColor(isLeashDirectionComplete ? .black : (isLeashStartStopComplete ? activeColor : .gray))
                                            Text("Direction change")
                                                .font(Font.custom("Poppins", size: 16))
                                                .foregroundColor(isLeashDirectionComplete ? .black : (isLeashStartStopComplete ? activeColor : .gray))
                                        }
                                    }
                                    
                                    
                                    Divider()
                                    
                                    Button(action: {
                                        if isLeashDirectionComplete   {
                                            programSheetLeashLoose.toggle()
                                        }
                                    }) {
                                        HStack {
                                            Image(systemName: isLeashLooseComplete ? "checkmark" : (isLeashDirectionComplete ? "circle" : "lock"))
                                                .foregroundColor(isLeashLooseComplete ? .black : (isLeashDirectionComplete ? activeColor : .gray))
                                            Text("Loose leash walking")
                                                .font(Font.custom("Poppins", size: 16))
                                                .foregroundColor(isLeashLooseComplete ? .black : (isLeashDirectionComplete ? activeColor : .gray))
                                        }
                                    }
                                    
                                    Divider()
                             
                                    Button(action: {
                                        if isLeashLooseComplete   {
                                            programSheetLeashHeel.toggle()
                                        }
                                    }) {
                                        HStack {
                                            Image(systemName: isLeashHeelComplete ? "checkmark" : (isLeashLooseComplete ? "circle" : "lock"))
                                                .foregroundColor(isLeashHeelComplete ? .black : (isLeashLooseComplete ? activeColor : .gray))
                                            Text("Heel")
                                                .font(Font.custom("Poppins", size: 16))
                                                .foregroundColor(isLeashHeelComplete ? .black : (isLeashLooseComplete ? activeColor : .gray))
                                        }
                                    }
                                    
                                    Divider()
                                    
                                    Button(action: {
                                        if isLeashHeelComplete   {
                                            programSheetLeashQuiz.toggle()
                                        }
                                    }) {
                                        HStack {
                                            Image(systemName: isLeashQuizComplete ? "checkmark" : (isLeashHeelComplete ? "circle" : "lock"))
                                                .foregroundColor(isLeashQuizComplete ? .black : (isLeashHeelComplete ? activeColor : .gray))
                                            Text("Quiz")
                                                .font(Font.custom("Poppins", size: 16))
                                                .foregroundColor(isLeashQuizComplete ? .black : (isLeashHeelComplete ? activeColor : .gray))
                                        }
                                    }
                                }
                                
                               
                                
                                Spacer()
                                
                                
                                //main button
                                ZStack {
                                    GetNamesButton(text: leashButtonLabel) {
                                        switch activeTask() {
                                        case "Leash and collar introduction":
                                            programSheetLeashIntro.toggle()
                                        case "Start and stop":
                                            programSheetLeashStartStop.toggle()
                                        case "Direction change":
                                            programSheetLeashDirection.toggle()
                                        case "Loose leash walking":
                                            programSheetLeashLoose.toggle()
                                        case "Heel":
                                            programSheetLeashHeel.toggle()
                                        case "Quiz":
                                            programSheetLeashQuiz.toggle()
                                        default:
                                            Text("All done!")
                                            
                                        }
                                        leashButtonLabel = "Continue"
                                        programStatusLeash = ProgramStatusLeash.inProgress.rawValue
                                        print(programStatusLeash)
                                    }
                                    .opacity(isLeashIntroComplete && isLeashStartStopComplete && isLeashDirectionComplete && isLeashLooseComplete && isLeashHeelComplete && isLeashQuizComplete ? 0 : 1)
                                    
                                    
                                    
                                    
                                }
                                
                                
                            }
                            .padding()
                            
                            
                            
                        }
                        
                    }
                }
        }
            .navigationViewStyle(StackNavigationViewStyle())
            
            
    }
        .sheet(isPresented: $programSheetLeashIntro) {
            ProgramSheetLeashIntro()
        }
        .sheet(isPresented: $programSheetLeashStartStop) {
            ProgramSheetLeashStartStop()
        }
        .sheet(isPresented: $programSheetLeashDirection) {
            ProgramSheetLeashDirection()
        }
        .sheet(isPresented: $programSheetLeashLoose) {
            ProgramSheetLeashLoose()
        }
        .sheet(isPresented: $programSheetLeashHeel) {
            ProgramSheetLeashHeel()
        }
        .sheet(isPresented: $programSheetLeashQuiz) {
            ProgramSheetLeashQuiz()
                .onDisappear {
                    if isLeashQuizComplete {
                        programStatusLeash = ProgramStatusLeash.completed.rawValue
                        print(programStatusLeash)
                    }
                }
        }
        
    }
}

#Preview {
    ProgramViewLeash()
}
