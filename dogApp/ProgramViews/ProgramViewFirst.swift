//
//  ProgramViewFirst.swift
//  dogApp
//
//  Created by Kaspars Jelaiskis on 15/11/2023.
//

import SwiftUI
import Firebase


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
    
    @StateObject private var viewModel = ProgramViewModel()
    let program: ProgramStructure
    @State private var programSheetStructures: [ProgramSheetStructure] = ProgramSheetDatabase.programs
    
    @State private var selectedLesson: ProgramSheetStructure? = nil
    
    @State private var isLessonOneComplete: Bool = false
    @State private var isLessonTwoComplete: Bool = false
    @State private var isLessonThreeComplete: Bool = false
    @State private var isLessonFourComplete: Bool = false
    
    // update later to show label dynamically
    @State private var label = "Start lesson"
    
    @State private var programLabel = ""
    
    
    @State private var programSheetActive: ProgramSheetStructure? = nil

    private func activeTask() -> String {
        if !isLessonOneComplete {
            return "Sit"
        } else if !isLessonTwoComplete {
            return "Recall"
        } else if !isLessonThreeComplete {
            return "Stay"
        } else if !isLessonFourComplete {
            return "EyeContact"
        } else {
            return "AllTasksCompleted"
        }
    }

    private func isLessonComplete(for programSheet: ProgramSheetStructure) -> Bool {
        switch programSheet.id {
        case 1:
            return isLessonOneComplete
        case 2:
            return isLessonTwoComplete
        case 3:
            return isLessonThreeComplete
        case 4:
            return isLessonFourComplete
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
                                
                                if isLessonFourComplete {
                                    
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
                                            
                                            // debug: reset button
//                                            Button(action: {
//                                                isLessonOneComplete = false
//                                                isLessonTwoComplete = false
//                                                isLessonThreeComplete = false
//                                                isLessonFourComplete = false
//
//                                            }, label: {
//                                                Text("Reset")
//                                            })
                                        }
                                    }
                                }
                                
                                Text("This program will teach you the essentials when getting started with your fist dog. You can build upon these foundations to teach more advanced commands.")
                                    .font(.custom("Poppins-Regular", size: 16))
                                    .lineLimit(nil)
                                    .fixedSize(horizontal: false, vertical: true)
                                
                                Text("Curriculum")
                                    .font(.custom("SignikaNegative-SemiBold", size: 18))
                                
                                
                                VStack(alignment: .leading, spacing: 12) {
                                    
                                   
                                    ForEach(programSheetStructures.prefix(4)) { programSheet in
                                        let index = programSheetStructures.firstIndex(of: programSheet) ?? 0
                                        let isPreviousTaskComplete = index > 0 ? isLessonComplete(for: programSheetStructures[index - 1]) : true

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

                                }
                                
                                //   main button
                                
                                ZStack {
                                    GetNamesButton(text: label) {
                                        // Set the active task based on the current active lesson
                                        programSheetActive = programSheetStructures.first { isLessonComplete(for: $0) == false }
                                        
                                        // Check if there are no completed lessons
                                        let hasNoCompletedLessons = !isLessonOneComplete && !isLessonTwoComplete && !isLessonThreeComplete && !isLessonFourComplete
                                        
                                        // Update label based on the presence of completed lessons
                                               label = hasNoCompletedLessons ? "Start lesson" : "Continue"
                                        
                                        // Run UserManager.shared.addUserProgram only if there are no completed lessons - works
                                        if hasNoCompletedLessons {
                                            UserManager.shared.addUserProgram(programId: program.id)
                                        }
                                        
                                        
//                                        programStatusFirst = ProgramStatusFirst.inProgress.rawValue
//                                        print(programStatusFirst)
                                    }
                                    .opacity(isLessonOneComplete && isLessonTwoComplete && isLessonThreeComplete && isLessonFourComplete ? 0 : 1)
                                }
                                .sheet(item: $programSheetActive) { activeLesson in
                                    ProgramSheetTemplate(program: activeLesson)
                                }
                            }
                            .padding()
                            
                        }
                    }
                }
            }
            .navigationViewStyle(StackNavigationViewStyle())
        }
        //figure out what is redundant here
        .onAppear() {
            AnalyticsManager.shared.logEvent(name: "ProgramViewFirst_Opened")
        }
        .onChange(of: selectedLesson) { _ in
            Task {
                do {
                    let authDataResult = try AuthenticationManager.shared.getAuthenticatedUser()
                    let userLessons = try await UserManager.shared.getUserLessons(userId: authDataResult.uid)
                    isLessonOneComplete = userLessons.contains { $0.lessonId == 1 }
                    isLessonTwoComplete = userLessons.contains { $0.lessonId == 2 }
                    isLessonThreeComplete = userLessons.contains { $0.lessonId == 3 }
                    isLessonFourComplete = userLessons.contains { $0.lessonId == 4 }
                    
                    print("Completed lessons: \(userLessons.map { $0.lessonId })")
                } catch {
                    print("Error fetching user lessons:", error.localizedDescription)
                }
                if isLessonFourComplete {
                        UserManager.shared.completeUserProgram(programId: program.id)
                    }
                Task {
                        do {
                            let authDataResult = try AuthenticationManager.shared.getAuthenticatedUser()
                            let userProgramStatus = try await UserManager.shared.getUserProgramStatus(userId: authDataResult.uid, programId: program.id)

                            switch userProgramStatus {
                            case ProgramStatusFirst.inProgress.rawValue:
                                programLabel = "In progress"
                            case ProgramStatusFirst.completed.rawValue:
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
                    isLessonOneComplete = userLessons.contains { $0.lessonId == 1 }
                    isLessonTwoComplete = userLessons.contains { $0.lessonId == 2 }
                    isLessonThreeComplete = userLessons.contains { $0.lessonId == 3 }
                    isLessonFourComplete = userLessons.contains { $0.lessonId == 4 }
                    
                    print("Completed lessons: \(userLessons.map { $0.lessonId })")
                } catch {
                    print("Error fetching user lessons:", error.localizedDescription)
                }
                if isLessonFourComplete {
                        UserManager.shared.completeUserProgram(programId: program.id)
                    }
                Task {
                        do {
                            let authDataResult = try AuthenticationManager.shared.getAuthenticatedUser()
                            let userProgramStatus = try await UserManager.shared.getUserProgramStatus(userId: authDataResult.uid, programId: program.id)

                            switch userProgramStatus {
                            case ProgramStatusFirst.inProgress.rawValue:
                                programLabel = "In progress"
                            case ProgramStatusFirst.completed.rawValue:
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
            print("Active Lesson changed to \(newActiveLesson?.title ?? "nil")")
           
        }
        .onAppear {
            Task {
                do {
                    let authDataResult = try AuthenticationManager.shared.getAuthenticatedUser()
                    let userLessons = try await UserManager.shared.getUserLessons(userId: authDataResult.uid)
                    isLessonOneComplete = userLessons.contains { $0.lessonId == 1 }
                    isLessonTwoComplete = userLessons.contains { $0.lessonId == 2 }
                    isLessonThreeComplete = userLessons.contains { $0.lessonId == 3 }
                    isLessonFourComplete = userLessons.contains { $0.lessonId == 4 }

                    print("Completed lessons: \(userLessons.map { $0.lessonId })")
                } catch {
                    print("Error fetching user lessons:", error.localizedDescription)
                }
                if isLessonFourComplete {
                        UserManager.shared.completeUserProgram(programId: program.id)
                    }
                Task {
                        do {
                            let authDataResult = try AuthenticationManager.shared.getAuthenticatedUser()
                            let userProgramStatus = try await UserManager.shared.getUserProgramStatus(userId: authDataResult.uid, programId: program.id)

                            switch userProgramStatus {
                            case ProgramStatusFirst.inProgress.rawValue:
                                programLabel = "In progress"
                            case ProgramStatusFirst.completed.rawValue:
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
                isLessonOneComplete = userLessons.contains { $0.lessonId == 1 }
                isLessonTwoComplete = userLessons.contains { $0.lessonId == 2 }
                isLessonThreeComplete = userLessons.contains { $0.lessonId == 3 }
                isLessonFourComplete = userLessons.contains { $0.lessonId == 4 }

                print("Completed lessons: \(userLessons.map { $0.lessonId })")
            } catch {
                print("Error fetching user lessons:", error.localizedDescription)
            }
            
        }
        
    }
}


#Preview {
    ProgramViewFirst(program: ProgramStructure(id: 1, title: "String?", status: "String?", image: "puppy"))
}

