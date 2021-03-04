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
    @Published var loginSignupPushed = false
    let title = "Settings"
    private let userService: UserServiceProtocol
    private var cancellables: [AnyCancellable] = []

    init(userService: UserServiceProtocol = UserService()) {
        self.userService = userService
    }
    func item(at index: Int) -> SettingsItemViewModel {
        itemViewModels[index]
    }

    func tappedItem(at index: Int) {
        switch itemViewModels[index].type {
        case .mode:
            // change loight to dark or vice versa
            isDarkMode = !isDarkMode
            buildItems()
        case .account:
            guard userService.currentUser?.email == nil else { return }
            loginSignupPushed = true
        case .logout:
            userService.logout().sink { completion in
                switch completion {
                case let .failure(error):
                    print(error)
                case .finished:
                    print("finished")
                }
            } receiveValue: { _ in
                
            }.store(in: &cancellables)
            print("logout")
        default:
            break
        }
    }
    
    private func buildItems() {
        itemViewModels = [
            .init(title: userService.currentUser?.email ?? "Create Account", iconName: "person.circle", type: .account),
            .init(title: "Switch to \(isDarkMode ? "Light" : "Dark") Model", iconName: "lightbulb", type: .mode),
            .init(title: "Privacy Policy", iconName: "shield", type: .privacy)
        ]
        
        if userService.currentUser?.email != nil {
            itemViewModels += [.init(title: "Logout", iconName: "arrowshape.turn.up.left", type: .logout)]
        }
    }
    
    func onAppear() {
        buildItems()
    }
}
