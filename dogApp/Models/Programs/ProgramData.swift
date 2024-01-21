//
//  ProgramData.swift
//  dogApp
//
//  Created by Kaspars Jelaiskis on 10/01/2024.
//

import Foundation


struct ProgramStructure: Identifiable, Codable, Equatable {
    let id: Int
    let title: String?
    let status: String?
    let image: String?
   
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case status
        case image
    }
    
    static func ==(lhs: ProgramStructure, rhs: ProgramStructure) -> Bool {
        return lhs.id == rhs.id
    }
    
}

extension ProgramStructure {
    var dictionaryRepresentation: [String: Any] {
        [
            "id": id,
            "title": title ?? "",
            "status": status ?? "",
            "image": image ?? ""
        ]
    }
}


final class ProgramDatabase {
    
    static let programs: [ProgramStructure] = [
        
        ProgramStructure(id: 1, title: "My first puppy", status: "notStarted", image: "puppy"),
        ProgramStructure(id: 2, title: "Leash walking", status: "notStarted", image: "leashWalking"),
        ProgramStructure(id: 3, title: "Office training", status: "notStarted", image: "office")
    ]
}

struct ProgramArray: Codable {
    let programs: [ProgramStructure]
    let total, skip, limit: Int
}
