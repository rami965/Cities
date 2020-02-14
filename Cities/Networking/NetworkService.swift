//
//  NetworkService.swift
//  Shawermeh
//
//  Created by Rami on 2/14/20.
//  Copyright © 2020 Rami. All rights reserved.
//

import Moya

enum NetworkService {
    case cities(page: Int)
}

extension NetworkService: TargetType {
    var baseURL: URL {
        switch self {
        case .cities:
            return URL(string: Constants.baseURL)!
        }
    }
    
    var path: String {
        switch self {
        case .cities:
            return ApiPaths.citiesPath
        }
    }
    
    var method: Method {
        switch self {
        case .cities:
            return .get
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        var parameters = [String : Any]()
        switch self {
        case .cities(let page):
            parameters = ["page": page]
            return .requestParameters(parameters: parameters,
                                      encoding: URLEncoding.default)
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .cities:
            return nil
        }
    }
}
