//
//  Challenge.swift
//  Increment
//
//  Created by Guillem Solé Cubilo on 3/3/21.
//

import Foundation
import FirebaseFirestoreSwift

struct Challenge: Codable {
    @DocumentID var id: String?
    let exercise: String
    let startAmount: Int
    let increase: Int
    let length: Int
    let userId: String
    let startDate: Date
    
}
