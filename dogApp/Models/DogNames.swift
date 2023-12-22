//
//  DogNames.swift
//  dogApp
//
//  Created by Kaspars Jelaiskis on 10/09/2023.
//

import Foundation
import SwiftUI

struct dogNames {
    var namesMale = ["Max", "Buddy", "Charlie", "Rocky", "Cooper", "Duke", "Bear", "Tucker", "Oliver", "Leo", "Milo", "Finn", "Zeus", "Apollo", "Oscar", "Sam", "Teddy", "Winston", "Rusty", "Murphy", "Leo"]
    var namesFemale = ["Bella", "Luna", "Lucy", "Daisy", "Sadie", "Molly", "Lola", "Ruby", "Zoe", "Chloe", "Lily", "Coco", "Rosie", "Mia", "Bailey", "Sophie", "Lulu", "Stella", "Penny", "Gracie"]
    var namesUnisex = ["Riley", "Bailey", "Charlie", "Casey", "Morgan", "Max", "Jordan", "Taylor", "Quinn", "Dakota", "Sam", "Harley", "Alex", "Scout", "Avery", "Logan", "Reese", "Parker", "Sydney", "Skylar"]
    
    func randomMaleName() -> String? {
        guard !namesMale.isEmpty else {
            return nil // Return nil if the array is empty
        }
        
        let randomIndex = Int.random(in: 0..<namesMale.count)
        return namesMale[randomIndex]
    }
    
    
    func randomFemaleName() -> String? {
        guard !namesFemale.isEmpty else {
            return nil // Return nil if the array is empty
        }
        
        let randomIndex = Int.random(in: 0..<namesFemale.count)
        return namesFemale[randomIndex]
    }
    
    func randomName() -> String? {
            let allNames = namesMale + namesFemale
            
            guard !allNames.isEmpty else {
                return nil // Return nil if both arrays are empty
            }
            
            let randomIndex = Int.random(in: 0..<allNames.count)
            return allNames[randomIndex]
        }
    func randomUnisexName() -> String? {
      
        guard !namesUnisex.isEmpty else {
            return nil
        }
        let randomIndex = Int.random(in: 0..<namesUnisex.count)
        return namesUnisex[randomIndex]

    }
}

