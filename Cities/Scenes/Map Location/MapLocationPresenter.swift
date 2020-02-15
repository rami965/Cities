//
//  MapLocationPresenter.swift
//  Cities
//
//  Created by Rami on 2/15/20.
//  Copyright © 2020 Rami Saeed. All rights reserved.
//

import Foundation
import CoreLocation

class MapLocationPresenter: BasePresenter {
    
    // MARK: - Delegates
    
    private weak var sceneDelegate: MapLocationSceneDelegate?
    private weak var viewDelegate: MapLocationViewDelegate?
    
    // MARK: - Private Properties
    
    private var cityLat: String?
    private var cityLon: String?
    
    // MARK: - Initializers
    
    init(sceneDelegate: MapLocationSceneDelegate?,
         viewDelegate: MapLocationViewDelegate?,
         cityLat: String?,
         cityLon: String?) {
        self.sceneDelegate = sceneDelegate
        self.viewDelegate = viewDelegate
        self.cityLat = cityLat
        self.cityLon = cityLon
    }
    
    // MARK: - Private Functions
    
    // MARK: - Public Functions
    
    func getCLLocationCoordinates() -> CLLocationCoordinate2D? {
        guard let lat = cityLat,
            let lon = cityLon,
            let latDouble = Double(lat),
            let lonDouble = Double(lon)
            else { return nil }
        
        return CLLocationCoordinate2D(latitude: latDouble,
                                      longitude: lonDouble)
    }
    
}
