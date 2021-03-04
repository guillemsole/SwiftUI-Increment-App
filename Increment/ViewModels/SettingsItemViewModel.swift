//
//  SettingsItemViewModel.swift
//  Increment
//
//  Created by Guillem Solé Cubilo on 4/3/21.
//

import Foundation

extension SettingsViewModel {
    struct SettingsItemViewModel {
        let title: String
        let iconName: String
        let type: SettingsItemType
    }

    enum SettingsItemType {
        case account
        case mode
        case privacy
    }
}

