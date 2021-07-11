//
//  MovieViewModel.swift
//  MovieMania
//
//  Created by Ahmad Ubaidillah on 10/07/21.
//

import Foundation
import RxSwift
import RxCocoa

struct MovieViewModel {
    var items = PublishSubject<[Movie]>()
    let api_key = "03e80ec218d275ecbcd184de03af1ad2"
    
//    func fetchItem(){
//        var listResponse: ListResponse
//        var movieList = [Movie]()
//
//        if let path = Bundle.main.path(forResource: "MockData", ofType: "json"){
//            print(path)
//            do{
//                let data = try Data(contentsOf: URL(fileURLWithPath: path))
//                listResponse = try JSONDecoder().decode(ListResponse.self, from: data)
//
//                movieList = listResponse.results
//            }catch{
//                print(error)
//            }
//
//            items.onNext(movieList)
//            items.onCompleted()
//        }
//    }
    
    func fetchItem() {
        let url = "https://api.themoviedb.org/3/movie/popular?api_key=\(api_key)&language=en-US&page=1"
        var movieList = [Movie]()
        print(url)
        guard let url = URL(string: url) else { return }

        URLSession.shared.dataTask(with: url){
            data, response, err in
            
            var listResponse: ListResponse
            
            print(data)
            
            if(err == nil){
                do{
                    listResponse = try JSONDecoder().decode(ListResponse.self, from: data!)
                    
                    DispatchQueue.main.async {
                        movieList = listResponse.results
                        items.onNext(movieList)
                        items.onCompleted()
                    }
                    
                }catch{
                    print(error)
                }
            }
        }.resume()
    }
}
