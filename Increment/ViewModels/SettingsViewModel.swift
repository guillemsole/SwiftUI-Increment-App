//
//  SettingsViewModel.swift
//  Increment
//
//  Created by Guillem Solé Cubilo on 4/3/21.
//

import Combine
import SwiftUI

final class SettingsViewModel: ObservableObject {
    @AppStorage("isDarkMode") private var isDarkMode = false
    @Published private(set) var itemViewModels: [SettingsItemViewModel] = []
    let title = "Settings"

    func item(at index: Int) -> SettingsItemViewModel {
        itemViewModels[index]
    }

    func tappedItem(at index: Int) {
        switch itemViewModels[index].type {
        case .mode:
            // change loight to dark or vice versa
            isDarkMode = !isDarkMode
            buildItems()
        default:
            break
        }
    }
    
    private func buildItems() {
        itemViewModels = [
            .init(title: "Create Account", iconName: "person.circle", type: .account),
            .init(title: "Switch to \(isDarkMode ? "Light" : "Dark") Model", iconName: "lightbulb", type: .mode),
            .init(title: "Privacy Policy", iconName: "shield", type: .privacy)
        ]
    }
    
    func onAppear() {
        buildItems()
    }
}
