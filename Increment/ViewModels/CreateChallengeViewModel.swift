//
//  CreateChallengeViewModel.swift
//  Increment
//
//  Created by Guillem Solé Cubilo on 2/3/21.
//

import SwiftUI
import Combine

typealias UserId = String

class CreateChallengeViewModel: ObservableObject {
//    @Published var dropdowns: [ChallengePartViewModel] = [
//        .init(type: .exercise),
//        .init(type: .startAmount),
//        .init(type: .increase),
//        .init(type: .length)
//    ]
    
    @Published var exerciseDropdown = ChallengePartViewModel(type: .exercise)
    @Published var startAmountDropdown = ChallengePartViewModel(type: .startAmount)
    @Published var increaseDropdown = ChallengePartViewModel(type: .increase)
    @Published var lengthDropdown = ChallengePartViewModel(type: .length)
    
    
    private let userService: UserServiceProtocol
    private var cancellables: [AnyCancellable] = []
    enum Action {
        case createChallenge
    }
    
    init(userService: UserServiceProtocol = UserService()) {
        self.userService = userService
    }
    
    func send(action: Action) {
        switch action {
        case .createChallenge:
            currentUserId().sink { completion in
                switch completion {
                case let .failure(error):
                        print(error.localizedDescription)
                case .finished:
                    print("completed")
                }
                
            } receiveValue: { userId in
                print("retrived userId = \(userId)")
            }.store(in: &cancellables)
        }

    }
    
    private func currentUserId() -> AnyPublisher<UserId, Error> {
        print("getting user id")
        return userService.currentUser().flatMap { user -> AnyPublisher<UserId, Error> in
            if let userId = user?.uid {
                print("user is logged in...")
                return Just(userId)
                    .setFailureType(to: Error.self)
                    .eraseToAnyPublisher()
            } else {
                print("user is being logged in annonmously...")
                return self.userService
                    .signInAnonymously()
                    .map {$0.uid}
                    .eraseToAnyPublisher()
            }
        }.eraseToAnyPublisher()
    }
}

extension CreateChallengeViewModel {
    struct ChallengePartViewModel: DropdownItemProtocol {
        var isSelected: Bool = false
        
        var selectedOption: DropdownOption
        
        var options: [DropdownOption]
        
        var headerTitle: String {
            type.rawValue
        }
        
        var dropdownTitle: String {
            selectedOption.formatted
        }
            
        private let type: ChallengePartType
        
        init(type: ChallengePartType) {
            switch type {
            case .exercise:
                self.options = ExerciseOption.allCases.map {$0.toDropDownOption}
            case .startAmount:
                self.options = StartOption.allCases.map {$0.toDropDownOption}
            case .increase:
                self.options = IncreaseOption.allCases.map {$0.toDropDownOption}
            case .length:
                self.options = LengthOption.allCases.map {$0.toDropDownOption}
            }
            self.type = type
            self.selectedOption = options.first!
        }
        
        enum ChallengePartType: String, CaseIterable {
            case exercise = "Exercise"
            case startAmount = "Starting Amount"
            case increase = "Daily Increase"
            case length = "Challenge Length"
        }
        
        enum ExerciseOption: String, CaseIterable, DropdownOptionProtocol {
            case pullups
            case pushups
            case situp
            
            var toDropDownOption: DropdownOption {
                .init(type: .text(rawValue), formatted: rawValue.capitalized)
            }
        }
        
        enum StartOption: Int, CaseIterable, DropdownOptionProtocol {
            case one = 1, two, three, four, five
            
            var toDropDownOption: DropdownOption {
                .init(type: .number(rawValue), formatted: "\(rawValue)")
            }
        }
        
        enum IncreaseOption: Int, CaseIterable, DropdownOptionProtocol {
            case one = 1, two, three, four, five
            
            var toDropDownOption: DropdownOption {
                .init(type: .number(rawValue), formatted: "+\(rawValue)")
            }
        }
        
        enum LengthOption: Int, CaseIterable, DropdownOptionProtocol {
            case seven = 7, fourteen = 14, twentyOne = 21, twentyEight = 28
            
            var toDropDownOption: DropdownOption {
                .init(type: .number(rawValue), formatted: "\(rawValue) days")
            }
        }
    }
}
