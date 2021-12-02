//
//  MoviesListViewModel.swift
//  PopularMovies
//
//  Created by Shimaa on 12/1/21.
//

import Foundation
import Combine



class MoviesListViewModel: ObservableObject {
    
    var cancellation = Set<AnyCancellable>()
    @Published var movies: [MovieModel] = []
    
    
    init() {
        getMovies()
    }
    
    
    func getMoviesCount() -> Int {
        return movies.count
    }
    
   
    func getImgData(index: Int) -> Data? {
        guard let imgData = movies[index].posterImgData else {
            getImage(from: index)
            return nil
        }
        return imgData
    }
    
    
    func getTitle(index: Int) -> String {
        return movies[index].title ?? ""
    }
    
    
    func getMovieModel(index: Int) -> MovieModel {
        return movies[index]
    }
    
    
    func getMovies() {
        NetworkHandler.shared.requestTarget(target: .getPopularMovies, model: MoviesResponse.self).sink(receiveCompletion: { completion in
            print("completion is \(completion)")
        }, receiveValue: { [weak self] moviesResponse in
            self?.movies = moviesResponse.results ?? []
        }).store(in: &cancellation)
    }
    
    
    func getImage(from index: Int) {
        ImagesHandler.shared.downloadImg(imgUrl: movies[index].poster_path ?? "")
            .sink(receiveCompletion: {
                print("completion is \($0)")
            }, receiveValue: { [weak self] imgData in
                self?.movies[index].posterImgData = imgData
            }).store(in: &cancellation)
    }
}
