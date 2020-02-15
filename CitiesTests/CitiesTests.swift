//
//  CitiesTests.swift
//  CitiesTests
//
//  Created by Rami Saeed on 2/13/20.
//  Copyright © 2020 Rami Saeed. All rights reserved.
//

import XCTest
@testable import Cities

class CitiesTests: XCTestCase {

    var citiesPresenter: CitiesPresenter?
    var cities: [City] = []
        
    override func setUp() {
        super.setUp()
        citiesPresenter = CitiesPresenter(sceneDelegate: nil,
                                          viewDelegate: nil)
        cities.append(City(id: nil, country: nil, name: "aaa", coordinates: nil))
        cities.append(City(id: nil, country: nil, name: "Aas", coordinates: nil))
        cities.append(City(id: nil, country: nil, name: "Bda", coordinates: nil))
        cities.append(City(id: nil, country: nil, name: "baa", coordinates: nil))
        cities.append(City(id: nil, country: nil, name: "Bra", coordinates: nil))
        cities.append(City(id: nil, country: nil, name: "Zda", coordinates: nil))
        cities.append(City(id: nil, country: nil, name: "ypa", coordinates: nil))
        cities.append(City(id: nil, country: nil, name: "Pna", coordinates: nil))
        cities.append(City(id: nil, country: nil, name: ";kh", coordinates: nil))
        cities.append(City(id: nil, country: nil, name: "[ou]", coordinates: nil))
        cities.append(City(id: nil, country: nil, name: "=+k", coordinates: nil))
        cities.append(City(id: nil, country: nil, name: "/2@", coordinates: nil))
        cities.append(City(id: nil, country: nil, name: "🥰", coordinates: nil))
        cities.append(City(id: nil, country: nil, name: "*7&", coordinates: nil))
        cities.append(City(id: nil, country: nil, name: "aBu", coordinates: nil))
        cities.append(City(id: nil, country: nil, name: "-tt", coordinates: nil))
        cities.append(City(id: nil, country: nil, name: "Csf", coordinates: nil))
        cities.append(City(id: nil, country: nil, name: "Qee", coordinates: nil))
        cities.append(City(id: nil, country: nil, name: "xff", coordinates: nil))
        cities.append(City(id: nil, country: nil, name: "U*9", coordinates: nil))
        cities.append(City(id: nil, country: nil, name: "()", coordinates: nil))
    }

    override func tearDown() {
        citiesPresenter = nil
        cities = []
        super.tearDown()
    }

    func testSearchFilterEmptyString() {
        let result = citiesPresenter?.filterCitiesForSearchText(unfilteredList: cities, "")
        XCTAssertEqual(result?.count, cities.count)
    }
    
    func testSearchFilterNilString() {
        let result = citiesPresenter?.filterCitiesForSearchText(unfilteredList: cities, nil)
        XCTAssertEqual(result?.count, 0)
    }
    
    func testEmptyListWithEmptyString() {
        let result = citiesPresenter?.filterCitiesForSearchText(unfilteredList: [], "")
        XCTAssertEqual(result?.count, 0)
    }
    
    func testEmptyListWithNilString() {
        let result = citiesPresenter?.filterCitiesForSearchText(unfilteredList: [], nil)
        XCTAssertEqual(result?.count, 0)
    }
    
    func testSearchFilterWithOneLowerCaseCharacter() {
        let result = citiesPresenter?.filterCitiesForSearchText(unfilteredList: cities, "a")
        XCTAssertEqual(result?.count, 3)
    }
    
    func testSearchFilterWithOneUpperCaseCharacter() {
        let result = citiesPresenter?.filterCitiesForSearchText(unfilteredList: cities, "A")
        XCTAssertEqual(result?.count, 3)
    }
    
    func testSearchFilterWithTwoLowerCaseCharacter() {
        let result = citiesPresenter?.filterCitiesForSearchText(unfilteredList: cities, "ba")
        XCTAssertEqual(result?.count, 1)
    }
    
    func testSearchFilterWithTwoUpperCaseCharacter() {
        let result = citiesPresenter?.filterCitiesForSearchText(unfilteredList: cities, "BA")
        XCTAssertEqual(result?.count, 1)
    }
    
    func testSearchFilterWithSpecialCharacters() {
        let result = citiesPresenter?.filterCitiesForSearchText(unfilteredList: cities, "=+")
        XCTAssertEqual(result?.count, 1)
    }
    
    func testSearchFilterWithNonEnglishCharacters() {
        let result = citiesPresenter?.filterCitiesForSearchText(unfilteredList: cities, "ن")
        XCTAssertEqual(result?.count, 0)
    }
    
    func testSearchFilterWithMixedCharacters() {
        let result = citiesPresenter?.filterCitiesForSearchText(unfilteredList: cities, "U*9")
        XCTAssertEqual(result?.count, 1)
    }
    
    func testSearchFilterWithEmoji() {
        let result = citiesPresenter?.filterCitiesForSearchText(unfilteredList: cities, "🥰")
        XCTAssertEqual(result?.count, 1)
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
