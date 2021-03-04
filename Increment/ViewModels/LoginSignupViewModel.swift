//
//  LoginSignupViewModel.swift
//  Increment
//
//  Created by Guillem Solé Cubilo on 4/3/21.
//

import Foundation

final class LoginSignupViewModel: ObservableObject {
    private let mode: Mode
    @Published var emailText = ""
    @Published var passwordText = ""
    @Published var isValid = false
    
    var title: String {
        switch mode {
        case .login:
            return "Welcome back!"
        case .signup:
            return "Create an account"
        }
    }
    
    var subtitle: String {
        switch mode {
        case .login:
            return "Log in with your email"
        case .signup:
            return "Sign up via email"
        }
    }
    
    var buttonTitle: String {
        switch mode {
        case .login:
            return "Log in"
        case .signup:
            return "Sign up"
        }
    }
    init(mode: Mode) {
        self.mode = mode
    }
}

extension LoginSignupViewModel {
    enum Mode {
        case login
        case signup
    }
}
