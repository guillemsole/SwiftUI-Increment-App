//
//  UserService.swift
//  Increment
//
//  Created by Guillem Solé Cubilo on 2/3/21.
//

import Foundation
import Combine
import FirebaseAuth

protocol UserServiceProtocol {
    func currentUser() -> AnyPublisher<User?, Never>
    func signInAnonymously() -> AnyPublisher<User, IncrementError>
}

final class UserService: UserServiceProtocol {
    func currentUser() -> AnyPublisher<User?, Never> {
        Just(Auth.auth().currentUser).eraseToAnyPublisher()
    }
    
    // Single use publisher
    func signInAnonymously() -> AnyPublisher<User, IncrementError> {
        return Future<User, IncrementError> { promise in
            Auth.auth().signInAnonymously { result, error in
                if let error = error {
                    return promise(.failure(.auth(description: error.localizedDescription)))
                } else if let user = result?.user {
                    return promise(.success(user))
                }
            }
        }.eraseToAnyPublisher()
    }
}
