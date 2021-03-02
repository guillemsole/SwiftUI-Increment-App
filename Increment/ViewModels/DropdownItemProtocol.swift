//
//  DropdownItemProtocol.swift
//  Increment
//
//  Created by Guillem Solé Cubilo on 2/3/21.
//

import Foundation

protocol DropdownItemProtocol {
    var options: [DropdownOption] {get}
    var headerTitle: String {get}
    var dropdownTitle: String {get}
    var isSelected: Bool {get set}
}

protocol DropdownOptionProtocol {
    var toDropDownOption: DropdownOption {get}
}

struct DropdownOption {
    enum DropdownOptionType {
        case text(String)
        case number(Int)
    }
    let type: DropdownOptionType
    let formatted: String
    var isSelected: Bool
}
