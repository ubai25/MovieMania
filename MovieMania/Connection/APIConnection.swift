//
//  APIConnection.swift
//  MovieMania
//
//  Created by Ahmad Ubaidillah on 11/07/21.
//

import Foundation
import UIKit
import RxSwift

class APIConnection {
    let api_key = "03e80ec218d275ecbcd184de03af1ad2"
    let imageBaseUrl = "https://www.themoviedb.org/t/p/w440_and_h660_face"
    var disposable : Disposable?
    
    deinit {
        disposable?.dispose()
    }
    
    func callApi() -> Observable<Bool> {
        let url = "https://api.themoviedb.org/3/movie/popular?api_key=\(api_key)&language=en-US&page=1"
        var movieList = [Movie]()
        print(url)
        
        return Observable.create { observer -> Disposable in
            
            guard let url = URL(string: url) else { return Disposables.create()}
            
            URLSession.shared.dataTask(with: url){
                data, response, err in
                
                var listResponse: ListResponse
                
                if(err == nil){
                    let realmRepo = RealmRepo()
                    
                    do{
                        listResponse = try JSONDecoder().decode(ListResponse.self, from: data!)
                        
                        movieList = listResponse.results
                        realmRepo.deleteAll()
                        
                        self.disposable = realmRepo.saveMovies(movies: movieList)
                            .subscribe(onNext: { result in
                                if(result){
                                    observer.onNext(true)
                                    observer.onCompleted()
                                }
                            })
                        
                    }catch{
                        print(error)
                    }
                }
            }.resume()
            return Disposables.create()
        }
    }
    
    func load(path: String) -> UIImage? {
        
        guard let url = URL(string: imageBaseUrl.appending(path)) else { return nil }
        
        if let data = try? Data(contentsOf: url) {
            if let image = UIImage(data: data) {
                return image
            }
        }
        return nil
    }
}

extension UIImageView {
    
    func load(path: String) {
        let imageBaseUrl = "https://www.themoviedb.org/t/p/w440_and_h660_face"
        
        guard let url = URL(string: imageBaseUrl.appending(path)) else { return }
        
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
