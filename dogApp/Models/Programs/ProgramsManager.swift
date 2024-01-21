//
//  ProgramsManager.swift
//  dogApp
//
//  Created by Kaspars Jelaiskis on 10/01/2024.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

final class ProgramsManager {
    static let shared = ProgramsManager()
    private init() { }

    private let programsCollection = Firestore.firestore().collection("programs")
    
    private func programDocument(programId: String) -> DocumentReference {
        programsCollection.document(programId)
    }
    
    func uploadProgram(program: ProgramStructure) async throws {
        try programDocument(programId: String(program.id)).setData(from: program, merge: false)
    }

    func getProgram(programId: String) async throws -> ProgramStructure {
        try await programDocument(programId: programId).getDocument(as: ProgramStructure.self)
    }
    
    private func getAllProgramsQuery() -> Query {
        programsCollection
    }
    func getAllPrograms(count: Int, lastDocument: DocumentSnapshot?) async throws -> (products: [ProgramStructure], lastDocument: DocumentSnapshot?) {
        var query: Query = getAllProgramsQuery()
        
        return try await query
            .startOptionally(afterDocument: lastDocument)
            .getDocumentsWithSnapshot(as: ProgramStructure.self)
    }
    
   
   

 
}
