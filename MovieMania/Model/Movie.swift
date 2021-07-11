//
//  Movie.swift
//  MovieMania
//
//  Created by Ahmad Ubaidillah on 10/07/21.
//

import Foundation

struct Movie: Decodable {
    var id: Int
    var original_language: String
    var original_title: String
    var overview: String
    var popularity: Float
    var poster_path: String
    var backdrop_path: String
    var release_date: String
    var title: String
    var vote_average:  Float
    var vote_count: Int
}
