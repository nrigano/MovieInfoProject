//
//  movieInfo.swift
//  MovieInfoProject
//
//  Created by Nick on 1/31/17.
//  Copyright © 2017 Nick. All rights reserved.
//


//take in dictionary


import Foundation

class MovieInfo {
    var title: String
    var year: String
    var imdbID: String
    var type: String
    var poster: String
    
    init(title: String, year: String, imdbID: String, type: String, poster: String) {
        self.title = title
        self.year = year
        self.imdbID = imdbID
        self.type = type
        self.poster = poster
    }
    
    init(movie: [String: String]) {
        if let title = movie["Title"] {self.title = title} else {self.title = ""}
        if let year = movie["Year"] {self.year = year} else {self.year = ""}
        if let imdbID = movie["imdbIB"] {self.imdbID = imdbID} else {self.imdbID = ""}
        if let type = movie["Type"] {self.type = type} else {self.type = ""}
        if let poster = movie["Poster"] {self.poster = poster} else {self.poster = ""}
        
    }
    
    
    
}
