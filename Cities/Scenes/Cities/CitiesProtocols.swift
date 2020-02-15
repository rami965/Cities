//
//  CitiesProtocols.swift
//  Cities
//
//  Created by Rami on 2/14/20.
//  Copyright © 2020 Rami Saeed. All rights reserved.
//

import Foundation

protocol CitiesSceneDelegate: class {
    func didSelectCity(lat: String?, lon: String?)
}

protocol CitiesViewDelegate: class {
    func showLoader()
    func hideLoader()
    func hideLoadMoreIndicator()
    func reloadData(animated: Bool)
    func showError(error: String)
}

protocol CitiesCellViewDelegate: class {
    func displayCityName(name: String?)
    func displayCountryName(name: String?)
    func displayLocationImage(with imageURL: URL?)
}
