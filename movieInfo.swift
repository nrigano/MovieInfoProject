//
//  movieInfo.swift
//  MovieInfoProject
//
//  Created by Nick on 1/31/17.
//  Copyright © 2017 Nick. All rights reserved.
//

import Foundation

class MovieInfo {
    var title: String
    var year: String
    var imdbID: String
    var poster: String
    
    init(title: String, year: String, imdbID: String, poster: String) {
        self.title = title
        self.year = year
        self.imdbID = imdbID
        self.poster = poster
    }
}
