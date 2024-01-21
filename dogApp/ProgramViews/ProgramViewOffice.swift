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
    
    @StateObject private var viewModel = ProgramViewModel()
    let program: ProgramStructure
    @State private var programSheetStructures: [ProgramSheetStructure] = ProgramSheetDatabase.programs
    @State private var selectedLesson: ProgramSheetStructure? = nil
    
    @State private var isLessonTenComplete: Bool = false
    @State private var isLessonElevenComplete: Bool = false
    @State private var isLessonTwelveComplete: Bool = false
    @State private var isLessonThirteenComplete: Bool = false
    @State private var isLessonFourteenComplete: Bool = false
    @State private var isLessonQuizComplete: Bool = false

    
    @State private var label = "Start lesson"
    @State private var programLabel = ""
    @State private var programSheetActive: ProgramSheetStructure? = nil
    @State private var isQuizSheetPresented = false
    
    
    private func activeTask() -> String {
        if !isLessonTenComplete {
            return "OfficeDesensitization"
        } else if !isLessonElevenComplete {
            return "Place"
        } else if !isLessonTwelveComplete {
            return "GreePolitely"
        } else if !isLessonThirteenComplete {
            return "SafeSpace"
        } else if !isLessonFourteenComplete {
            return "Socialization"
        } else if !isLessonQuizComplete {
            return "Quiz"
        } else {
            return "AllTasksCompleted"
        }
    }
    
    
    private func isLessonComplete(for programSheet: ProgramSheetStructure) -> Bool {
        switch programSheet.id {
        case 10:
            return isLessonTenComplete
        case 11:
            return isLessonElevenComplete
        case 12:
            return isLessonTwelveComplete
        case 13:
            return isLessonThirteenComplete
        case 14:
            return isLessonFourteenComplete
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
                                .frame(width: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, height: 164)
                            
                            
                            
                            HStack(alignment: .bottom) {
                                VStack(alignment: .leading) {
                                    
                                    Text(programLabel)
                                        .font(.custom("SignikaNegative-SemiBold", size: 16))
                                        .foregroundColor(.white)
                                        .padding(.bottom, 32)
                                    
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
                                
                                if programLabel == "Completed" {
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
                                            
                                                                                    
                                        }
                                    }
                                    
                                }
                                
                                
                                Text("Bringing your dog to office can be stressful for you both. Follow this program and handle it like a pro.")
                                    .font(.custom("Poppins-Regular", size: 16))
                                    .lineLimit(nil)
                                    .fixedSize(horizontal: false, vertical: true)
                                
                                
                                Text("Curriculum")
                                    .font(.custom("SignikaNegative-SemiBold", size: 18))
                                
                                //list of lessons
                                VStack(alignment: .leading, spacing: 12) {
                                    
                                    ForEach(programSheetStructures[9..<14]) { programSheet in
                                        let index = programSheetStructures.firstIndex(of: programSheet) ?? 0
                                        let isPreviousTaskComplete = index > 9 ? isLessonComplete(for: programSheetStructures[index - 1]) : true
                                        
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
                                            Image(systemName: programLabel == "Completed" ? "checkmark" : (isLessonFourteenComplete ? "circle" : "lock" ))
                                            
                                            Text("Quiz")
                                        }
                                    }
                                    .disabled(!isLessonFourteenComplete)
                                    .foregroundColor(programLabel == "Completed" ? .black : (isLessonFourteenComplete ? activeColor : .gray))
                                    .sheet(isPresented: $isQuizSheetPresented) {
                                        ProgramSheetOfficeQuiz(program: ProgramStructure(id: 3, title: "String?", status: "String?", image: "puppy"))
                                    }
                                    
                                }
                                
                                
                                Spacer()
                                
                                
                                //main button
                                ZStack {
                                    GetNamesButton(text: label) {
                                        let activeTaskID: Int
                                        switch activeTask() {
                                        case "OfficeDesensitization":
                                            activeTaskID = 10
                                        case "Place":
                                            activeTaskID = 11
                                        case "GreePolitely":
                                            activeTaskID = 12
                                        case "SafeSpace":
                                            activeTaskID = 13
                                        case "Socialization":
                                            activeTaskID = 14
                                        default:
                                            activeTaskID = 10 // Set a default ID or handle this case appropriately
                                        }
                                        
                                        selectedLesson = programSheetStructures.first { $0.id == activeTaskID }
                                        
                                        let hasNoCompletedLessons = !isLessonTenComplete && !isLessonElevenComplete && !isLessonTwelveComplete && !isLessonThirteenComplete && !isLessonFourteenComplete
                                        
                                        label = hasNoCompletedLessons ? "Start lesson" : "Continue"
                                        
                                        if hasNoCompletedLessons {
                                            UserManager.shared.addUserProgram(programId: program.id)
                                        }
                                    }
                                    .opacity(isLessonTenComplete && isLessonElevenComplete && isLessonTwelveComplete && isLessonThirteenComplete && isLessonFourteenComplete ? 0 : 1)
                                   
                                    if isLessonFourteenComplete {
                                        
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
                .navigationViewStyle(StackNavigationViewStyle())
                
            }
        }
        .onChange(of: isQuizSheetPresented) { _ in
            Task {
                do {
                    let authDataResult = try AuthenticationManager.shared.getAuthenticatedUser()
                    let userLessons = try await UserManager.shared.getUserLessons(userId: authDataResult.uid)
                    isLessonTenComplete = userLessons.contains { $0.lessonId == 10 }
                    isLessonElevenComplete = userLessons.contains { $0.lessonId == 11 }
                    isLessonTwelveComplete = userLessons.contains { $0.lessonId == 12 }
                    isLessonThirteenComplete = userLessons.contains { $0.lessonId == 13 }
                    isLessonFourteenComplete = userLessons.contains { $0.lessonId == 14 }
                    
                    print("Completed lessons: \(userLessons.map { $0.lessonId })")
                } catch {
                    print("Error fetching user lessons:", error.localizedDescription)
                }

                Task {
                    do {
                        let authDataResult = try AuthenticationManager.shared.getAuthenticatedUser()
                        let userProgramStatus = try await UserManager.shared.getUserProgramStatus(userId: authDataResult.uid, programId: program.id)
                        
                        switch userProgramStatus {
                        case ProgramStatusOffice.inProgress.rawValue:
                            programLabel = "In progress"
                        case ProgramStatusOffice.completed.rawValue:
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
                    isLessonTenComplete = userLessons.contains { $0.lessonId == 10 }
                    isLessonElevenComplete = userLessons.contains { $0.lessonId == 11 }
                    isLessonTwelveComplete = userLessons.contains { $0.lessonId == 12 }
                    isLessonThirteenComplete = userLessons.contains { $0.lessonId == 13 }
                    isLessonFourteenComplete = userLessons.contains { $0.lessonId == 14 }
                    
                    print("Completed lessons: \(userLessons.map { $0.lessonId })")
                } catch {
                    print("Error fetching user lessons:", error.localizedDescription)
                }

                Task {
                    do {
                        let authDataResult = try AuthenticationManager.shared.getAuthenticatedUser()
                        let userProgramStatus = try await UserManager.shared.getUserProgramStatus(userId: authDataResult.uid, programId: program.id)
                        
                        switch userProgramStatus {
                        case ProgramStatusOffice.inProgress.rawValue:
                            programLabel = "In progress"
                        case ProgramStatusOffice.completed.rawValue:
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
                    isLessonTenComplete = userLessons.contains { $0.lessonId == 10 }
                    isLessonElevenComplete = userLessons.contains { $0.lessonId == 11 }
                    isLessonTwelveComplete = userLessons.contains { $0.lessonId == 12 }
                    isLessonThirteenComplete = userLessons.contains { $0.lessonId == 13 }
                    isLessonFourteenComplete = userLessons.contains { $0.lessonId == 14 }
                    
                    print("Completed lessons: \(userLessons.map { $0.lessonId })")
                } catch {
                    print("Error fetching user lessons:", error.localizedDescription)
                }
//                if isLessonFourteenComplete {
//                    UserManager.shared.completeUserProgram(programId: program.id)
//                }
                Task {
                    do {
                        let authDataResult = try AuthenticationManager.shared.getAuthenticatedUser()
                        let userProgramStatus = try await UserManager.shared.getUserProgramStatus(userId: authDataResult.uid, programId: program.id)
                        
                        switch userProgramStatus {
                        case ProgramStatusOffice.inProgress.rawValue:
                            programLabel = "In progress"
                        case ProgramStatusOffice.completed.rawValue:
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
                    isLessonTenComplete = userLessons.contains { $0.lessonId == 10 }
                    isLessonElevenComplete = userLessons.contains { $0.lessonId == 11 }
                    isLessonTwelveComplete = userLessons.contains { $0.lessonId == 12 }
                    isLessonThirteenComplete = userLessons.contains { $0.lessonId == 13 }
                    isLessonFourteenComplete = userLessons.contains { $0.lessonId == 14 }
                    
                    print("Completed lessons: \(userLessons.map { $0.lessonId })")
                } catch {
                    print("Error fetching user lessons:", error.localizedDescription)
                }
//                if isLessonFourteenComplete {
//                    UserManager.shared.completeUserProgram(programId: program.id)
//                }
                Task {
                    do {
                        let authDataResult = try AuthenticationManager.shared.getAuthenticatedUser()
                        let userProgramStatus = try await UserManager.shared.getUserProgramStatus(userId: authDataResult.uid, programId: program.id)
                        
                        switch userProgramStatus {
                        case ProgramStatusOffice.inProgress.rawValue:
                            programLabel = "In progress"
                        case ProgramStatusOffice.completed.rawValue:
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
                isLessonTenComplete = userLessons.contains { $0.lessonId == 10 }
                isLessonElevenComplete = userLessons.contains { $0.lessonId == 11 }
                isLessonTwelveComplete = userLessons.contains { $0.lessonId == 12 }
                isLessonThirteenComplete = userLessons.contains { $0.lessonId == 13 }
                isLessonFourteenComplete = userLessons.contains { $0.lessonId == 14 }
                
                
                print("Completed lessons: \(userLessons.map { $0.lessonId })")
            } catch {
                print("Error fetching user lessons:", error.localizedDescription)
            }
            
        }
    }
}

#Preview {
    ProgramViewOffice(program: ProgramStructure(id: 3, title: "String?", status: "String?", image: "puppy"))
}
