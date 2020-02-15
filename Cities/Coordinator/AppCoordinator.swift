//
//  AppCoordinator.swift
//  Cities
//
//  Created by Rami on 2/14/20.
//  Copyright © 2020 Rami Saeed. All rights reserved.
//

import UIKit

class AppCoordinator: Coordinator {
    
    // MARK: - Public Properties
    
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController

    // MARK: - Initializers
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    // MARK: - Public Functions
    
    func start() {
        showCitiesScene()
    }
    
    // MARK: - Private Functions
    
    private func showCitiesScene() {
        let citiesViewController = CitiesConfigurator().configuredViewController(delegate: self)
        navigationController.navigationBar.prefersLargeTitles = true
        navigationController.setViewControllers([citiesViewController], animated: true)
    }
    
    private func showMapLocationScene(_ lat: String?, _ lon: String?) {
        let mapLocationViewController = MapLocationConfigurator()
            .configuredViewController(delegate: self,
                                      cityLat: lat,
                                      cityLon: lon)
        navigationController.pushViewController(mapLocationViewController, animated: true)
    }
}

// MARK: - CitiesSceneDelegate
extension AppCoordinator: CitiesSceneDelegate {
    func didSelectCity(lat: String?, lon: String?) {
        showMapLocationScene(lat, lon)
    }
}

// MARK: - MapLocationSceneDelegate
extension AppCoordinator: MapLocationSceneDelegate {
    
}
