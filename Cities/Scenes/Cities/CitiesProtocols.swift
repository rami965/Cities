//
//  CitiesProtocols.swift
//  Cities
//
//  Created by Rami on 2/14/20.
//  Copyright © 2020 Rami Saeed. All rights reserved.
//

import Foundation

protocol CitiesSceneDelegate: class {
    
}

protocol CitiesViewDelegate: class {
    func showLoader()
    func hideLoader()
    func hideLoadMoreIndicator()
    func reloadData()
    func showError(error: String)
}

protocol CitiesCellViewDelegate: class {
    func displayCityName(name: String?)
    func displayCountryName(name: String?)
    func displayLocationImage(with imageURL: URL?)
}
