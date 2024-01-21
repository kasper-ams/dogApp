//
//  ProgramViewModel.swift
//  dogApp
//
//  Created by Kaspars Jelaiskis on 10/01/2024.
//

import Foundation
import Firebase
import Combine

@MainActor

final class ProgramViewModel: ObservableObject {
    
    @Published private(set) var programs: [ProgramStructure] = []
    @Published private(set) var userLessons: [Lesson] = []
    
    private var lastDocument: DocumentSnapshot? = nil
    private var cancellables = Set<AnyCancellable>()

    
    func uploadProgramsToFirebase() {
        Task {
            do {
                let programs = ProgramArray(programs: ProgramDatabase.programs, total: ProgramDatabase.programs.count, skip: 0, limit: 10)
                let programArray = programs.programs
                
                for program in programArray {
                    try? await ProgramsManager.shared.uploadProgram(program: program)
                }
                print("Success")
                print(programs.programs.count)
            } catch {
                print(error)
            }
        }
    }
    
    
    func uploadProgramSheetsToFirebase() {
        Task {
            do {
                let programSheets = ProgramSheetArray(programSheets: ProgramSheetDatabase.programs, total: ProgramSheetDatabase.programs.count, skip: 0, limit: 50)
                let programSheetArray = programSheets.programSheets
                
                for programs in programSheetArray {
                    try? await ProgramsManager.shared.uploadProgramSheet(programSheet: programs)
                }
                print("Success")
                print(programSheets.programSheets.count)
            } catch {
                print("error")
            }
        }
    }
    
   
    func updateLessonStatus(lessonId: Int) {
        Task {
            let authDataResult = try AuthenticationManager.shared.getAuthenticatedUser()
            
            do {
                try await UserManager.shared.updateLessonStatus(userId: authDataResult.uid, lessonId: lessonId)
                print("Lesson status updated")
            } catch {
                print("Error updating lesson status:", error.localizedDescription)
            }
        }
    }
    

    func removeLesson(userId: String, lessonId: Int) async throws {
            try await UserManager.shared.removeLesson(userId: userId, lessonId: lessonId)
        }
    
    func addListenerForLessons() {
        guard let authDataResult = try? AuthenticationManager.shared.getAuthenticatedUser() else { return }
        
        UserManager.shared.addListenerForUserLessons(userId: authDataResult.uid)
            .sink { completion in
                
            } receiveValue: { [weak self] lessons in
                self?.userLessons = lessons
            }
            .store(in: &cancellables)
    }
}
