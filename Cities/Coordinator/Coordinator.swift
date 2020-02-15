//
//  Coordinator.swift
//  Cities
//
//  Created by Rami on 2/14/20.
//  Copyright © 2020 Rami Saeed. All rights reserved.
//

import UIKit

protocol Coordinator: class {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
    
    func start()
    func addChildCoordinator(_ coordinator: Coordinator)
    func removeChildCoordinator(_ coordinator: Coordinator)
}

// MARK: - Defualt Implementation
extension Coordinator {
    func addChildCoordinator(_ coordinator: Coordinator) {
        for child in childCoordinators {
            if child === coordinator {
                return
            }
        }
        childCoordinators.append(coordinator)
    }
    
    func removeChildCoordinator(_ coordinator: Coordinator) {
        guard !childCoordinators.isEmpty else { return }
        if let index = childCoordinators
            .firstIndex(where: { $0 === coordinator }) {
            childCoordinators.remove(at: index)
        }
    }
}
