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
    private var lastDocument: DocumentSnapshot? = nil

    
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
    
//    func addUserProgram(programId: Int) {
//        Task {
//            let authDataResult = try AuthenticationManager.shared.getAuthenticatedUser()
//            try? await UserManager.shared.updateProgramStatusInFirestore(userId: authDataResult.uid, programId: programId)
//        }
//    }
    
    func addUserProgram(programId: Int) {
        Task {
            do {
                let authDataResult = try AuthenticationManager.shared.getAuthenticatedUser()
                let userId = authDataResult.uid
                let status = "inProgress" // Set the initial status 
                try? await UserManager.shared.updateProgramStatusInFirestore(userId: userId, programId: programId, status: status)
            } catch {
                print("Error getting authenticated user: \(error)")
            }
        }
    }
}
