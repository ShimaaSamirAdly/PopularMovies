//
//  MovieViewModel.swift
//  PopularMovies
//
//  Created by Shimaa on 12/1/21.
//

import Foundation
import Combine



class MovieDetailsViewModel {
    
    var movie: MovieModel?

    init(movie: MovieModel?) {
        self.movie = movie
    }


    func getMovieImg() -> Data {
        return movie?.posterImgData ?? Data()
    }
    
    
    func getMovieTitle() -> String {
        return movie?.original_title ?? ""
    }
    
    
    func getMovieOverView() -> String {
        return movie?.overview ?? ""
    }
}
