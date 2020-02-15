//
//  MapLocationConfigurator.swift
//  Cities
//
//  Created by Rami on 2/15/20.
//  Copyright © 2020 Rami Saeed. All rights reserved.
//

import Foundation

class MapLocationConfigurator {
    /// Returns viewController, configured with its associated presenter.
    func configuredViewController(delegate: MapLocationSceneDelegate,
                                  cityLat: String?,
                                  cityLon: String?) -> MapLocationViewController {
        let viewController = MapLocationViewController()
        let presenter = MapLocationPresenter(sceneDelegate: delegate,
                                             viewDelegate: viewController,
                                             cityLat: cityLat,
                                             cityLon: cityLon)
        viewController.setPresenter(presenter)
        return viewController
    }
}
