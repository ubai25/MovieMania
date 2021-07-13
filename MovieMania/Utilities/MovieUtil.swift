//
//  MovieUtil.swift
//  MovieMania
//
//  Created by Ahmad Ubaidillah on 12/07/21.
//

import Foundation

struct MovieUtil {
    let apiConnection: APIConnection
    
    init() {
        apiConnection = APIConnection()
    }
    
    func movieToMovieRealm(movie: Movie) -> MovieRealm {
        
        let movieRealm = MovieRealm()
        
        movieRealm.id = movie.id
        movieRealm.title = movie.title
        movieRealm.vote_count = movie.vote_count
        movieRealm.vote_average = movie.vote_average
        movieRealm.original_language = movie.original_language
        movieRealm.original_title = movie.original_title
        movieRealm.overview = movie.overview
        movieRealm.popularity = movie.popularity
        movieRealm.release_date = movie.release_date
        
        let image = apiConnection.load(path: movie.poster_path)
        let imageData = image?.jpegData(compressionQuality: 0.7)
        
        if(imageData != nil){
            movieRealm.poster_path = NSData(data: imageData!)
        }
        
        let image2 = apiConnection.load(path: movie.backdrop_path ?? movie.poster_path)
        let imageData2 = image2?.jpegData(compressionQuality: 0.7)
        
        if(imageData2 != nil){
            movieRealm.backdrop_path = NSData(data: imageData2!)
        }
        
        return movieRealm
    }
    
}
