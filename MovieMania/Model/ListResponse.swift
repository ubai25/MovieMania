//
//  ListResponse.swift
//  MovieMania
//
//  Created by Ahmad Ubaidillah on 10/07/21.
//

import Foundation

struct ListResponse: Decodable {
    var page: Int
    var results: [Movie]
}
