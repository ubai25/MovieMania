//
//  UrlServices.swift
//  MovieMania
//
//  Created by Ahmad Ubaidillah on 13/07/21.
//

import Foundation

struct UrlServices {
    
    func isUrlValid(stringUrl: String) -> URL? {
        guard let url = URL(string: stringUrl) else { return nil }
        return url
    }
    
}
