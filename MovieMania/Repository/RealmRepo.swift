//
//  RealmRepo.swift
//  MovieMania
//
//  Created by Ahmad Ubaidillah on 12/07/21.
//

import Foundation
import RealmSwift
import RxSwift

struct RealmRepo {
    let realm = try! Realm()
    let util = MovieUtil()
    
    func saveMovie(movie: Movie){
        let movieRealm = util.movieToMovieRealm(movie: movie)
        do{
            try realm.write{
                realm.add(movieRealm)
            }
        }catch{
            print("Error saving movie : \(error)")
        }
    }
    
    func saveMovies(movies: [Movie]) -> Observable<Bool> {
        return Observable.create { observer -> Disposable in
            for movie in movies{
                saveMovie(movie: movie)
                observer.onNext(true)
            }
            observer.onCompleted()
            return Disposables.create()
        }
    }
    
    func selectAllMovies() -> [MovieRealm]? {
        
        var data: Results<MovieRealm>?
        data = realm.objects(MovieRealm.self)
        
        guard let contains = data else { return nil }
            
        return Array(contains)
    }
    
    func deleteAll(){
        do {
            try realm.write {
                realm.deleteAll()
            }
        } catch {
            print("Error delete all data : \(error)")
        }
    }
}
