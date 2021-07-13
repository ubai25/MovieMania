//
//  MovieUtilTest.swift
//  MovieManiaTests
//
//  Created by Ahmad Ubaidillah on 13/07/21.
//

import XCTest
@testable import MovieMania

class MovieUtilTest: XCTestCase {
    
    var movieUtil: MovieUtil!
    var realmRepo : RealmRepo!
    
    override func setUp() {
        super.setUp()
        movieUtil = MovieUtil()
        realmRepo = RealmRepo()
    }
    
    override func tearDown() {
        movieUtil = nil
        realmRepo = nil
        super.tearDown()
    }
    
    func testConvertionMovieToMovieRealm(){
        
        var listResponse: ListResponse
        var movieList = [Movie]()
        var movie: Movie!
        var movieRealm: MovieRealm
        
        if let path = Bundle.main.path(forResource: "MockData", ofType: "json"){
            print(path)
            do{
                let data = try Data(contentsOf: URL(fileURLWithPath: path))
                listResponse = try JSONDecoder().decode(ListResponse.self, from: data)
                
                movieList = listResponse.results
            }catch{
                print(error)
            }
        }
        
        movie = movieList.first
        
        movieRealm = movieUtil.movieToMovieRealm(movie: movie)
        
        XCTAssertNotNil(movieRealm)
        XCTAssertEqual(movieRealm.id, movie.id)
        XCTAssertEqual(movieRealm.title, movie.title)
        XCTAssertEqual(movieRealm.overview, movie.overview)
        XCTAssertNotNil(movieRealm.backdrop_path)
        XCTAssertNotNil(movieRealm.poster_path)
    }
}
