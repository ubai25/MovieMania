//
//  MovieRealm.swift
//  MovieMania
//
//  Created by Ahmad Ubaidillah on 12/07/21.
//

import Foundation
import RealmSwift

class MovieRealm: Object {
    @objc dynamic var id: Int = 0
    @objc dynamic var original_language: String = ""
    @objc dynamic var original_title: String = ""
    @objc dynamic var overview: String = ""
    @objc dynamic var popularity: Float = 0.0
    @objc dynamic var poster_path: NSData? = nil
    @objc dynamic var backdrop_path: NSData? = nil
    @objc dynamic var release_date: String = ""
    @objc dynamic var title: String = ""
    @objc dynamic var vote_average: Float = 0.0
    @objc dynamic var vote_count: Int = 0
}
