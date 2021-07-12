//
//  MovieViewModel.swift
//  MovieMania
//
//  Created by Ahmad Ubaidillah on 10/07/21.
//

import Foundation
import RxSwift
import RxCocoa

class MovieViewModel {
    var items = PublishSubject<[MovieRealm]>()
    let realmRepo = RealmRepo()
    private let apiConnection = APIConnection()
    var disposable : Disposable?
    
    deinit {
        disposable?.dispose()
    }
    
    init() {
        disposable = apiConnection.callApi()
            .subscribe(onNext: { result in
                if(result){
                    self.fetchItem()
                }
            })
    }
    
    func fetchItem() {
        DispatchQueue.main.async { [self] in
            let movieList = realmRepo.selectAllMovies()
            
            guard let movies = movieList else { return }
            
            items.onNext(movies)
//            items.onCompleted()
        }
    }
}
