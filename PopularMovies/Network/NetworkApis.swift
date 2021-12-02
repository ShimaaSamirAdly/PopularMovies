//
//  NetworkApis.swift
//  PopularMovies
//
//  Created by Shimaa on 12/1/21.
//

import Foundation


enum NetworkApis {
    case getPopularMovies
}


extension NetworkApis {
    private var baseURL: URL? {
        return URL(string: Constants.BASEURL)
    }
    
    
    private var path: String {
        switch self {
        case .getPopularMovies:
            return "movie/popular"
        }
    }
    
    
    private var method: HttpMethods {
        switch self {
        case .getPopularMovies:
            return .get
        }
    }
    
    
    private var queryParams: [URLQueryItem] {
        let queryParams = [URLQueryItem(name: "api_key", value: Constants.APIKEY)]
        
        return queryParams
    }
}


extension NetworkApis {
    func getUrlRequest() -> URLRequest? {
        guard let url = baseURL?.appendingPathComponent(path) else {
            return nil
        }
        
        var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: true)
        urlComponents?.queryItems = queryParams
        var urlRequest = URLRequest(url: (urlComponents?.url)!)
        urlRequest.httpMethod = method.rawValue
        
        return urlRequest
    }
}
