//
//  LandingViewModel.swift
//  Increment
//
//  Created by Guillem Solé Cubilo on 4/3/21.
//

import Foundation

final class LandingViewModel: ObservableObject {
    @Published var loginSignupPushed = false
    @Published var createPush = false
    
    let title = "Increment"
    let createButtonTitle = "Create a challenge"
    let createButtonImageName = "plus.circle"
    let alreadyButtonTitle = "I already have an account"
    let backgroundImageName = "pullups"
}
