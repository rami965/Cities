//
//  MapLocationPresenter.swift
//  Cities
//
//  Created by Rami on 2/15/20.
//  Copyright © 2020 Rami Saeed. All rights reserved.
//

import Foundation

class MapLocationPresenter: BasePresenter {
    
    private weak var sceneDelegate: MapLocationSceneDelegate?
    private weak var viewDelegate: MapLocationViewDelegate?
    
    private var cityLat: String?
    private var cityLon: String?
    
    init(sceneDelegate: MapLocationSceneDelegate?,
         viewDelegate: MapLocationViewDelegate?,
         cityLat: String?,
         cityLon: String?) {
        self.sceneDelegate = sceneDelegate
        self.viewDelegate = viewDelegate
        self.cityLat = cityLat
        self.cityLon = cityLon
    }
    
}
