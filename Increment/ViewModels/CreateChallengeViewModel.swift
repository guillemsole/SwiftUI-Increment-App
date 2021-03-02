//
//  CreateChallengeViewModel.swift
//  Increment
//
//  Created by Guillem Solé Cubilo on 2/3/21.
//

import SwiftUI

class CreateChallengeViewModel: ObservableObject {
    @Published var dropdowns: [ChallengePartViewModel] = [
        .init(type: .exercise),
        .init(type: .startAmount),
        .init(type: .increase),
        .init(type: .length)
    ]
    
    enum Action {
        case selectOption(index: Int)
    }
    
    var hasSelectedDropdown: Bool {
        selectedDropdownIndex != nil
    }
    
    var selectedDropdownIndex: Int? {
        dropdowns.enumerated().first(where: { $0.element.isSelected})?.offset
    }
    
    var displayedOptions: [DropdownOption] {
        guard let selectedDropdownIndex = selectedDropdownIndex else { return [] }
        return dropdowns[selectedDropdownIndex].options
    }
    
    func send(action: Action) {
        switch action {
        case let .selectOption(index):
            guard let selectedDropdownIndex = selectedDropdownIndex else { return }
            clearSelectedOption()
            dropdowns[selectedDropdownIndex].options[index].isSelected = true
            clearSelectedDropdown()
        }
    }
    
    func clearSelectedOption() {
        guard let selectedDropdownIndex = selectedDropdownIndex else { return }
        dropdowns[selectedDropdownIndex].options.indices.forEach { index in
            dropdowns[selectedDropdownIndex].options[index].isSelected = false
        }
    }
    
    func clearSelectedDropdown() {
        guard let selectedDropdownIndex = selectedDropdownIndex else { return }
        dropdowns[selectedDropdownIndex].isSelected = false
    }
}

extension CreateChallengeViewModel {
    struct ChallengePartViewModel: DropdownItemProtocol {
        var options: [DropdownOption]
        
        var headerTitle: String {
            type.rawValue
        }
        
        var dropdownTitle: String {
            options.first(where: {$0.isSelected})?.formatted ?? ""
        }
        
        var isSelected: Bool = false
        
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
                .init(type: .text(rawValue), formatted: rawValue.capitalized, isSelected: self == .pushups)
            }
        }
        
        enum StartOption: Int, CaseIterable, DropdownOptionProtocol {
            case one = 1, two, three, four, five
            
            var toDropDownOption: DropdownOption {
                .init(type: .number(rawValue), formatted: "\(rawValue)", isSelected: self == .one)
            }
        }
        
        enum IncreaseOption: Int, CaseIterable, DropdownOptionProtocol {
            case one = 1, two, three, four, five
            
            var toDropDownOption: DropdownOption {
                .init(type: .number(rawValue), formatted: "+\(rawValue)", isSelected: self == .one)
            }
        }
        
        enum LengthOption: Int, CaseIterable, DropdownOptionProtocol {
            case seven = 7, fourteen = 14, twentyOne = 21, twentyEight = 28
            
            var toDropDownOption: DropdownOption {
                .init(type: .number(rawValue), formatted: "\(rawValue) days", isSelected: self == .seven)
            }
        }
    }
}
