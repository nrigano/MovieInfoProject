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
    
    var rated: String
    var released: String
    var runtime: String
    var genre: String
    var director: String
    var writer: String
    var actors: String
    var plot: String
    var language: String
    var country: String
    var awards: String
    var metascore: String
    var imdbRating: String
    var imdbVotes: String
    
    
    
    init(title: String, year: String, imdbID: String, type: String, poster: String, rated: String, released: String, runtime: String, genre: String, director: String, writer: String, actors: String, plot: String, language: String, country: String, awards: String, metascore: String, imdbRating: String, imdbVotes: String) {
        self.title = title
        self.year = year
        self.imdbID = imdbID
        self.type = type
        self.poster = poster
        
        self.rated = rated
        self.released = released
        self.runtime = runtime
        self.genre = genre
        self.director = director
        self.writer = writer
        self.actors = actors
        self.plot = plot
        self.language = language
        self.country = country
        self.awards = awards
        self.metascore = metascore
        self.imdbRating = imdbRating
        self.imdbVotes = imdbVotes
        
    }
    
    init(movie: [String: String]) {
        if let title = movie["Title"] {self.title = title} else {self.title = ""}
        if let year = movie["Year"] {self.year = year} else {self.year = ""}
        if let imdbID = movie["imdbIB"] {self.imdbID = imdbID} else {self.imdbID = ""}
        if let type = movie["Type"] {self.type = type} else {self.type = ""}
        if let poster = movie["Poster"] {self.poster = poster} else {self.poster = ""}
        if let rated = movie["Rated"] {self.rated = rated} else {self.rated = ""}
        if let released = movie["Released"] {self.released = released} else {self.released = ""}
        if let runtime = movie["Runtime"] {self.runtime = runtime} else {self.runtime = ""}
        if let genre = movie["Genre"] {self.genre = genre} else {self.genre = ""}
        if let director = movie["Director"] {self.director = director} else {self.director = ""}
        if let writer =  movie["Writer"] {self.writer = writer} else {self.writer = ""}
        if let actors = movie["Actors"] {self.actors = actors} else {self.actors = ""}
        if let plot = movie["Plot"] {self.plot = plot} else {self.plot = ""}
        if let language = movie["Language"] {self.language = language} else {self.language = ""}
        if let country = movie["Country"] {self.country = country} else {self.country = ""}
        if let awards = movie["Awards"] {self.awards = awards} else {self.awards = ""}
        if let metascore = movie["Metascore"] {self.metascore = metascore} else {self.metascore = ""}
        if let imdbRating = movie["imdbRating"] {self.imdbRating = imdbRating} else {self.imdbRating = ""}
        if let imdbVotes = movie["imdbVotes"] {self.imdbVotes = imdbVotes} else {self.imdbVotes = ""}
    }
    
    
    
}
