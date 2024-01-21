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
    
    
    
    @StateObject private var viewModel = ProgramViewModel()
    let program: ProgramStructure
    @State private var programSheetStructures: [ProgramSheetStructure] = ProgramSheetDatabase.programs
    @State private var selectedLesson: ProgramSheetStructure? = nil
    
    @State private var isLessonFiveComplete: Bool = false
    @State private var isLessonSixComplete: Bool = false
    @State private var isLessonSevenComplete: Bool = false
    @State private var isLessonEightComplete: Bool = false
    @State private var isLessonNineComplete: Bool = false

    
    @State private var label = "Start lesson"
    @State private var programLabel = ""
    @State private var programSheetActive: ProgramSheetStructure? = nil
    
    @State private var isQuizSheetPresented = false

    
    private func activeTask() -> String {
        if !isLessonFiveComplete {
            return "LeashAndCollarIntroduction"
        } else if !isLessonSixComplete {
            return "StartAndStop"
        } else if !isLessonSevenComplete {
            return "DirectionChange"
        } else if !isLessonEightComplete {
            return "LooseLeashWalking"
        } else if !isLessonNineComplete {
                return "Heel"
        } else {
            return "AllTasksCompleted"
        }
    }
    
    private func isLessonComplete(for programSheet: ProgramSheetStructure) -> Bool {
        switch programSheet.id {
        case 5:
            return isLessonFiveComplete
        case 6:
            return isLessonSixComplete
        case 7:
            return isLessonSevenComplete
        case 8:
            return isLessonEightComplete
        case 9:
            return isLessonNineComplete
        default:
            return false
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
                                .frame(width: .infinity, height: 164)
                            
                            
                            
                            HStack(alignment: .bottom) {
                                VStack(alignment: .leading) {
                                
                                    Text(programLabel)
                                        .font(.custom("SignikaNegative-SemiBold", size: 16))
                                        .foregroundColor(.white)
                                        .padding(.bottom, 32)
                                    
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
                                
                                if programLabel == "Completed" {
                                    
                                    ZStack(alignment: .leading) {
                                        RoundedRectangle(cornerRadius: 8)
                                            .fill(Color(red: 0.91, green: 1, blue: 0.94))
                                            .frame(width: .infinity, height: 36)
                                        VStack(alignment: .leading) {
                                            HStack(alignment: .center, spacing: 2) {
                                                Image(systemName: "checkmark.seal")
                                                    .foregroundColor(.green)
                                                Text("Program completed!")
                                                    .font(.custom("Poppins-Medium", size: 16))
                                                    .foregroundColor(.green)
                                                
                                            }
                                            .padding()
                                            
//                                            // debug: reset button
//                                            Button(action: {
//                                                isLessonFiveComplete = false
//                                                isLessonSixComplete = false
//                                                isLessonSevenComplete = false
//                                                isLessonEightComplete = false
//                                                isLessonNineComplete = false
//                                                
//                                            }, label: {
//                                                Text("Reset")
//                                            })
                                        }
                                    }
                                }
                                
                                Text("Teaching a dog to walk on a leash is an important skill for both the dog and the owner. This program will help you achieve a well-behaved and leash-trained dog.")
                                    .font(.custom("Poppins-Regular", size: 16))
                                    .lineLimit(nil)
                                    .fixedSize(horizontal: false, vertical: true)
                                
                                
                                Text("Curriculum")
                                    .font(.custom("SignikaNegative-SemiBold", size: 18))
                                
                                //list of lessons
                                VStack(alignment: .leading, spacing: 12) {
                                    
                                    ForEach(programSheetStructures[4..<9]) { programSheet in
                                        let index = programSheetStructures.firstIndex(of: programSheet) ?? 0
                                        let isPreviousTaskComplete = index > 4 ? isLessonComplete(for: programSheetStructures[index - 1]) : true
                                        
                                        LessonButton(
                                            text: programSheet.title,
                                            isComplete: isLessonComplete(for: programSheet),
                                            action: {
                                                selectedLesson = programSheet
                                            },
                                            isPreviousTaskComplete: isPreviousTaskComplete
                                        )
                                        .sheet(item: $selectedLesson) { lesson in
                                            ProgramSheetTemplate(program: lesson)
                                        }
                                        Divider()
                                        
                                    }
                                    Button {
                                        isQuizSheetPresented = true
                                    } label: {
                                        HStack {
                                            Image(systemName: programLabel == "Completed" ? "checkmark" : (isLessonNineComplete ? "circle" : "lock" ))
                                            
                                            Text("Quiz")
                                        }
                                    }
                                    .disabled(!isLessonNineComplete)
                                    .foregroundColor(programLabel == "Completed" ? .black : (isLessonNineComplete ? activeColor : .gray))
                                    .sheet(isPresented: $isQuizSheetPresented) {
                                        ProgramSheetLeashQuiz(program: ProgramStructure(id: 2, title: "String?", status: "String?", image: "puppy"))
                                    }
                                }
                                
                                Spacer()
                                
                                
                                //main button
                                ZStack {
                                    GetNamesButton(text: label) {
                                        let activeTaskID: Int
                                        switch activeTask() {
                                        case "LeashAndCollarIntroduction":
                                            activeTaskID = 5
                                        case "StartAndStop":
                                            activeTaskID = 6
                                        case "DirectionChange":
                                            activeTaskID = 7
                                        case "LooseLeashWalking":
                                            activeTaskID = 8
                                        case "Heel":
                                            activeTaskID = 9
                                        default:
                                            activeTaskID = 5 // Set a default ID or handle this case appropriately
                                        }

                                        selectedLesson = programSheetStructures.first { $0.id == activeTaskID }

                                        let hasNoCompletedLessons = !isLessonFiveComplete && !isLessonSixComplete && !isLessonSevenComplete && !isLessonEightComplete && !isLessonNineComplete
                                        
                                        label = hasNoCompletedLessons ? "Start lesson" : "Continue"
                                        
                                        if hasNoCompletedLessons {
                                            UserManager.shared.addUserProgram(programId: program.id)
                                        }
                                    }
                                    .opacity(isLessonFiveComplete && isLessonSixComplete && isLessonSevenComplete && isLessonEightComplete && isLessonNineComplete ? 0 : 1)
                                    
                                    if isLessonNineComplete {
                                        
                                        GetNamesButton(text: label) {
                                            isQuizSheetPresented = true
                                        }
                                        .opacity(programLabel != "Completed" ? 1 : 0)
                                    }
                                }
                                .sheet(item: $selectedLesson) { lesson in
                                    ProgramSheetTemplate(program: lesson)
                                }
                            }
                            .padding()
                        }
                        
                    }
                }
            }
            .navigationViewStyle(StackNavigationViewStyle())
        }
        
        .onChange(of: isQuizSheetPresented) { _ in
            Task {
                do {
                    let authDataResult = try AuthenticationManager.shared.getAuthenticatedUser()
                    let userLessons = try await UserManager.shared.getUserLessons(userId: authDataResult.uid)
                    isLessonFiveComplete = userLessons.contains { $0.lessonId == 5 }
                    isLessonSixComplete = userLessons.contains { $0.lessonId == 6 }
                    isLessonSevenComplete = userLessons.contains { $0.lessonId == 7 }
                    isLessonEightComplete = userLessons.contains { $0.lessonId == 8 }
                    isLessonNineComplete = userLessons.contains { $0.lessonId == 9 }

                    print("Completed lessons: \(userLessons.map { $0.lessonId })")
                } catch {
                    print("Error fetching user lessons:", error.localizedDescription)
                }

                Task {
                        do {
                            let authDataResult = try AuthenticationManager.shared.getAuthenticatedUser()
                            let userProgramStatus = try await UserManager.shared.getUserProgramStatus(userId: authDataResult.uid, programId: program.id)

                            switch userProgramStatus {
                            case ProgramStatusLeash.inProgress.rawValue:
                                programLabel = "In progress"
                            case ProgramStatusLeash.completed.rawValue:
                                programLabel = "Completed"
                            default:
                                programLabel = ""
                            }
                        } catch {
                            print("Error getting user program status:", error.localizedDescription)
                        }
                    }
            }
            
        }
        .onChange(of: selectedLesson) { _ in
            Task {
                do {
                    let authDataResult = try AuthenticationManager.shared.getAuthenticatedUser()
                    let userLessons = try await UserManager.shared.getUserLessons(userId: authDataResult.uid)
                    isLessonFiveComplete = userLessons.contains { $0.lessonId == 5 }
                    isLessonSixComplete = userLessons.contains { $0.lessonId == 6 }
                    isLessonSevenComplete = userLessons.contains { $0.lessonId == 7 }
                    isLessonEightComplete = userLessons.contains { $0.lessonId == 8 }
                    isLessonNineComplete = userLessons.contains { $0.lessonId == 9 }

                    print("Completed lessons: \(userLessons.map { $0.lessonId })")
                } catch {
                    print("Error fetching user lessons:", error.localizedDescription)
                }

                Task {
                        do {
                            let authDataResult = try AuthenticationManager.shared.getAuthenticatedUser()
                            let userProgramStatus = try await UserManager.shared.getUserProgramStatus(userId: authDataResult.uid, programId: program.id)

                            switch userProgramStatus {
                            case ProgramStatusLeash.inProgress.rawValue:
                                programLabel = "In progress"
                            case ProgramStatusLeash.completed.rawValue:
                                programLabel = "Completed"
                            default:
                                programLabel = ""
                            }
                        } catch {
                            print("Error getting user program status:", error.localizedDescription)
                        }
                    }
            }
            
        }
        .onChange(of: programSheetActive) { newActiveLesson in
            Task {
                do {
                    let authDataResult = try AuthenticationManager.shared.getAuthenticatedUser()
                    let userLessons = try await UserManager.shared.getUserLessons(userId: authDataResult.uid)
                    isLessonFiveComplete = userLessons.contains { $0.lessonId == 5 }
                    isLessonSixComplete = userLessons.contains { $0.lessonId == 6 }
                    isLessonSevenComplete = userLessons.contains { $0.lessonId == 7 }
                    isLessonEightComplete = userLessons.contains { $0.lessonId == 8 }
                    isLessonNineComplete = userLessons.contains { $0.lessonId == 9 }
                    
                    print("Completed lessons: \(userLessons.map { $0.lessonId })")
                } catch {
                    print("Error fetching user lessons:", error.localizedDescription)
                }

                Task {
                        do {
                            let authDataResult = try AuthenticationManager.shared.getAuthenticatedUser()
                            let userProgramStatus = try await UserManager.shared.getUserProgramStatus(userId: authDataResult.uid, programId: program.id)

                            switch userProgramStatus {
                            case ProgramStatusLeash.inProgress.rawValue:
                                programLabel = "In progress"
                            case ProgramStatusLeash.completed.rawValue:
                                programLabel = "Completed"
                            default:
                                programLabel = ""
                            }
                        } catch {
                            print("Error getting user program status:", error.localizedDescription)
                        }
                    }
            }
            print("Active Lesson changed to \(newActiveLesson?.title ?? "nil")")
           
        }
        .onAppear {
            Task {
                do {
                    let authDataResult = try AuthenticationManager.shared.getAuthenticatedUser()
                    let userLessons = try await UserManager.shared.getUserLessons(userId: authDataResult.uid)
                    isLessonFiveComplete = userLessons.contains { $0.lessonId == 5 }
                    isLessonSixComplete = userLessons.contains { $0.lessonId == 6 }
                    isLessonSevenComplete = userLessons.contains { $0.lessonId == 7 }
                    isLessonEightComplete = userLessons.contains { $0.lessonId == 8 }
                    isLessonNineComplete = userLessons.contains { $0.lessonId == 9 }

                    print("Completed lessons: \(userLessons.map { $0.lessonId })")
                } catch {
                    print("Error fetching user lessons:", error.localizedDescription)
                }

                Task {
                        do {
                            let authDataResult = try AuthenticationManager.shared.getAuthenticatedUser()
                            let userProgramStatus = try await UserManager.shared.getUserProgramStatus(userId: authDataResult.uid, programId: program.id)

                            switch userProgramStatus {
                            case ProgramStatusLeash.inProgress.rawValue:
                                programLabel = "In progress"
                            case ProgramStatusLeash.completed.rawValue:
                                programLabel = "Completed"
                            default:
                                programLabel = ""
                            }
                        } catch {
                            // Handle the error, log or present an error message
                            print("Error getting user program status:", error.localizedDescription)
                        }
                    }
            }
          
        }
        .task {
            do {
                let authDataResult = try AuthenticationManager.shared.getAuthenticatedUser()
                let userLessons = try await UserManager.shared.getUserLessons(userId: authDataResult.uid)
                isLessonFiveComplete = userLessons.contains { $0.lessonId == 5 }
                isLessonSixComplete = userLessons.contains { $0.lessonId == 6 }
                isLessonSevenComplete = userLessons.contains { $0.lessonId == 7 }
                isLessonEightComplete = userLessons.contains { $0.lessonId == 8 }
                isLessonNineComplete = userLessons.contains { $0.lessonId == 9 }

                print("Completed lessons: \(userLessons.map { $0.lessonId })")
            } catch {
                print("Error fetching user lessons:", error.localizedDescription)
            }
            
        }
        
        
    }
}

#Preview {
    ProgramViewOffice(program: ProgramStructure(id: 2, title: "String?", status: "String?", image: "puppy"))
}
