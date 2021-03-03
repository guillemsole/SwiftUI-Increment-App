//
//  Challenge.swift
//  Increment
//
//  Created by Guillem Solé Cubilo on 3/3/21.
//

import Foundation

struct Challenge: Codable {
    let exercise: String
    let startAmount: Int
    let increase: Int
    let length: Int
    let userId: String
    let startDate: Date
}
