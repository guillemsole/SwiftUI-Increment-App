//
//  ProgressCircleViewModel.swift
//  Increment
//
//  Created by Guillem Solé Cubilo on 4/3/21.
//

import Foundation

struct ProgressCircleViewModel {
    let title: String
    let message: String
    let percentageComplete: Double
    var shouldShowTitle: Bool {
        percentageComplete <= 1
    }
}
