//
//  CitiesPresenter.swift
//  Cities
//
//  Created by Rami on 2/14/20.
//  Copyright © 2020 Rami Saeed. All rights reserved.
//

import Foundation
import Alamofire

class CitiesPresenter: BasePresenter {
    
    private weak var sceneDelegate: CitiesSceneDelegate?
    private weak var viewDelegate: CitiesViewDelegate?
    
    private let networkProvider = NetworkProvider()
    
    private var cities = [City]()
    private var filteredCities = [City]()
    private var page = 1
    
    init(sceneDelegate: CitiesSceneDelegate,
         viewDelegate: CitiesViewDelegate) {
        self.sceneDelegate = sceneDelegate
        self.viewDelegate = viewDelegate
    }
    
    private func getLocationImageURL(for index: Int) -> URL? {
        guard let lat = cities[index].coordinates?.lat,
            let lng = cities[index].coordinates?.lon else { return nil }
        let center = "\(lat.description),\(lng.description)"
        let zoomLevel = "13"
        let imageSize = "150x150"
        let mapType = "roadmap"
        let separator = "%7Clabel:C%7C"
        let markers = "color:red\(separator)\(center)"
        
        let baseURLString = Constants.staticMapBaseURL
        let staticMapsPath = ApiPaths.staticMapPath
        
        let fullURLString = baseURLString + staticMapsPath
            + "?"
            + "center=\(center)"
            + "&zoom=\(zoomLevel)"
            + "&size=\(imageSize)"
            + "&maptype=\(mapType)"
            + "&markers=\(markers)"
            + "&key=\(APIKeys.staticMapsKey)"
        
        return URL(string: fullURLString)
    }
    
    private func sortCitiesList(cities: [City]) -> [City] {
        guard !cities.isEmpty else { return [] }
        return cities.sorted { (firstCity, secondCity) -> Bool in
            if firstCity.name ?? "" != secondCity.name ?? "" {
                return firstCity.name ?? "" < secondCity.name ?? ""
            } else {
                return firstCity.country ?? "" < secondCity.country ?? ""
            }
        }
    }
    
    func fetchCities(isLoadingMore: Bool = false) {
        //show loader
        if !isLoadingMore { viewDelegate?.showLoader() }

        //increse the page number
        if isLoadingMore { page += 1 }
        
        networkProvider
            .request(target: .cities(page: page),
                     type: [City].self) { (cities, error) in
                        
                        isLoadingMore
                            ? self.viewDelegate?.hideLoadMoreIndicator()
                            : self.viewDelegate?.hideLoader()
                        
                        if let error = error {
                            print(error.localizedDescription)
                            self.viewDelegate?.showError(error: error.localizedDescription)
                        } else {
                            let fetchedCities = cities ?? []
                            if isLoadingMore {
                                self.cities.append(contentsOf: fetchedCities)
                            } else {
                                self.cities = fetchedCities
                            }
                            
                            let sortedCities = self.sortCitiesList(cities: self.cities)
                            self.cities = sortedCities
                            self.viewDelegate?.reloadData(animated: true)
                        }
        }
    }
    
    func filterCitiesForSearchText(_ searchText: String?) {
        guard let searchText = searchText else { return }
        filteredCities = cities
            .filter { $0.name?.lowercased()
                .starts(with: searchText.lowercased()) ?? false }
        viewDelegate?.reloadData(animated: true)
    }
    
    func viewDidLoad() {
        fetchCities()
    }
    
    func getCitiesCount(_ isFiltering: Bool) -> Int {
        return isFiltering ? filteredCities.count : cities.count
    }
    
    func configureCell(delegate: CitiesCellViewDelegate,
                       for index: Int,
                       _ isFiltering: Bool) {
        let city = isFiltering ? filteredCities[index] : cities[index]
        delegate.displayCityName(name: city.name)
        delegate.displayCountryName(name: city.country)
        delegate.displayLocationImage(with: getLocationImageURL(for: index))
    }
}
