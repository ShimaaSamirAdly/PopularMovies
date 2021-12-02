//
//  NetworkHandler.swift
//  PopularMovies
//
//  Created by Shimaa on 12/1/21.
//

import Foundation
import Combine

class NetworkHandler {
    
    static var shared = NetworkHandler()
    
    private init() {}
    
    func requestTarget<T: Codable>(target: NetworkApis, model: T.Type) -> AnyPublisher<T, Error> {
        
        let urlRequest = target.getUrlRequest()!

        return URLSession.shared.dataTaskPublisher(for: urlRequest)
            .mapError({ $0 })
            .map({ (data, _) in
                return data
            })
            .decode(type: model, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
    
    
    
    
}

