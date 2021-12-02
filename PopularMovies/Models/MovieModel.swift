//
//  MovieModel.swift
//  PopularMovies
//
//  Created by Shimaa on 12/1/21.
//

import Foundation


struct MovieModel: Codable, Identifiable {
    let adult: Bool?
    let backdrop_path: String?
    let genre_ids: [Int]?
    let id: Int?
    let original_language: String?
    let original_title: String?
    let overview: String?
    let popularity: Double?
    let poster_path: String?
    let release_date: String?
    let title: String?
    let video: Bool?
    let vote_average: Double?
    let vote_count: Int?
    var posterImgData: Data?
    
    
    mutating func setPasterData(data: Data) {
        self.posterImgData = data
    }
}
