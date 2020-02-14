//
//  AppCoordinator.swift
//  Cities
//
//  Created by Rami on 2/14/20.
//  Copyright © 2020 Rami Saeed. All rights reserved.
//

import UIKit

class AppCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        showCitiesScene()
    }
    
    private func showCitiesScene() {
        let citiesViewController = CitiesConfigurator().configuredViewController(delegate: self)
        navigationController.setViewControllers([citiesViewController], animated: true)
    }
}

// MARK: - CitiesSceneDelegate
extension AppCoordinator: CitiesSceneDelegate {
    
}
