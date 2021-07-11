//
//  APIConnection.swift
//  MovieMania
//
//  Created by Ahmad Ubaidillah on 11/07/21.
//

import Foundation
import RealmSwift

struct APIConnection {
    let api_key = "03e80ec218d275ecbcd184de03af1ad2"
    let realm = try! Realm()
    
    init() {
        callApi()
    }
    
    func callApi() {
        let url = "https://api.themoviedb.org/3/movie/popular?api_key=\(api_key)&language=en-US&page=1"
        var movieList = [Movie]()
        print(url)
        
        guard let url = URL(string: url) else { return }

        URLSession.shared.dataTask(with: url){
            data, response, err in
            
            var listResponse: ListResponse
            
            if(err == nil){
                do{
                    listResponse = try JSONDecoder().decode(ListResponse.self, from: data!)
                    
                    DispatchQueue.main.async {
                        movieList = listResponse.results
                        
                        for movie in movieList{
                            do{
                                try realm.write{
                                    realm.add(movie)
                                }
                            }catch{
                                print("Error saving context : \(error)")
                            }
                        }
                    }
                    
                }catch{
                    print(error)
                }
            }
        }.resume()
    }
}

extension UIImageView {
    func load(url: URL) {
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
