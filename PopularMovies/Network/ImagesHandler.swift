//
//  ImagesHandler.swift
//  PopularMovies
//
//  Created by Shimaa on 12/1/21.
//

import Foundation
import Combine


class ImagesHandler {
    
    static var shared = ImagesHandler()
    
    private init() {}
    
    func downloadImg(imgUrl: String) -> AnyPublisher<Data, Error> {
        let url = URL(string: Constants.IMAGEBASEURL + imgUrl)
        
        return URLSession.shared.dataTaskPublisher(for: url!)
            .mapError({ $0 })
            .map({ $0.data })
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
