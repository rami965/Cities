//
//  NetworkProvider.swift
//  Shawermeh
//
//  Created by Rami on 2/14/20.
//  Copyright © 2020 Rami. All rights reserved.
//

import Moya

class NetworkProvider {
    
    // MARK: - Network Provider Singleton
    
    static var shared = NetworkProvider()
    
    // MARK: - Private Properties
    
    private let provider = MoyaProvider<NetworkService>(
        plugins: [NetworkLoggerPlugin(verbose: true,
                                      cURL: true)]
    )
    
    // MARK: - Public Functions
    
    func request<T: Decodable>(target: NetworkService,
                               type: T.Type,
                               completion: @escaping ((T?, NetworkError?) -> Void)) {
        provider.request(target) { result in
            switch result {
            case .success(let response):
                do {
                    let decodedResponse = try JSONDecoder().decode(T.self,
                                                                   from: response.data)
                    completion(decodedResponse, nil)
                } catch {
                    let decodingError = NetworkError(error: error)
                    completion(nil, decodingError)
                }
                
            case .failure(let error):
                let responseError = NetworkError(error: error)
                completion(nil, responseError)
            }
        }
    }
}
