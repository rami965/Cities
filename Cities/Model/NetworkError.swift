//
//  NetworkError.swift
//  Shawermeh
//
//  Created by Rami on 2/14/20.
//  Copyright © 2020 Rami. All rights reserved.
//

import UIKit
import Moya

enum `Type`: String, Codable {
    case internalServer
    case authorization
    case `default`
}

struct NetworkError: Decodable, Error {
    
    // MARK: - Public Properties
    
    var type: Type?
    let status: Int?
    let error: String?
    
    // MARK: - Mapping Keys
    
    enum CodingKeys: String, CodingKey {
        case status
        case error
    }

    // MARK: - Initializers
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        status = try values.decodeIfPresent(Int.self, forKey: .status)
        error = try values.decodeIfPresent(String.self, forKey: .error)
    }

    init(error: Error) {
        status = error._code
        self.error = error.localizedDescription
        
        switch error._code {
        case 400..<500:
            type = .authorization
        case 500..<600:
            type = .internalServer
        default:
            type = .default
        }
    }
}
