//
//  MovieViewModel.swift
//  MovieMania
//
//  Created by Ahmad Ubaidillah on 10/07/21.
//

import Foundation
import RxSwift
import RxCocoa
import RealmSwift

struct MovieViewModel {
    var items = PublishSubject<[Movie]>()
    let realm = try! Realm()
    
    func fetchItem() {
        var movieList: Results<Movie>?
        
        DispatchQueue.main.async {
            print("Fetching!")
            movieList = realm.objects(Movie.self)
            
            guard let movies = movieList else {
                return
            }
            
            items.onNext(Array(movies))
            items.onCompleted()
        }
    }
}
