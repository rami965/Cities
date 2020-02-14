//
//  CitiesConfigurator.swift
//  Cities
//
//  Created by Rami on 2/14/20.
//  Copyright © 2020 Rami Saeed. All rights reserved.
//

import Foundation

class CitiesConfigurator {
    /// Returns viewController, configured with its associated presenter.
    func configuredViewController(delegate: CitiesSceneDelegate) -> CitiesViewController {
        let viewController = CitiesViewController()
        let presenter = CitiesPresenter(sceneDelegate: delegate,
                                        viewDelegate: viewController)
        viewController.setPresenter(presenter)
        return viewController
    }
}
