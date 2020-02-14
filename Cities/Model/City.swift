//
//  City.swift
//  Cities
//
//  Created by Rami on 2/14/20.
//  Copyright © 2020 Rami Saeed. All rights reserved.
//

struct City: Decodable {
    var id: String?
    var country: String?
    var name: String?
    var coordinates: CityCoordinates?
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case country
        case name
        case coordinates = "coord"
    }
}

struct CityCoordinates: Decodable {
    var lat: String?
    var lon: String?
    
    enum CodingKeys: CodingKey {
        case lat
        case lon
    }
    
}
