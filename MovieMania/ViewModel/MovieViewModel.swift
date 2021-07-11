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
    
    func fetchItem(){
        var listResponse: ListResponse
        var movieList = [Movie]()
        
        if let path = Bundle.main.path(forResource: "MockData", ofType: "json"){
            print(path)
            do{
                let data = try Data(contentsOf: URL(fileURLWithPath: path))
                listResponse = try JSONDecoder().decode(ListResponse.self, from: data)
                
                movieList = listResponse.results
            }catch{
                print(error)
            }
            
            items.onNext(movieList)
            items.onCompleted()
        }
    }
}
