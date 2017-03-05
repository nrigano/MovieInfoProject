//
//  APIClient.swift
//  MovieInfoProject
//
//  Created by Nick on 1/30/17.
//  Copyright © 2017 Nick. All rights reserved.
//

import Foundation

class APIClient {
    class func searchDB(withTitle: String, completion: @escaping ([MovieInfo]) -> ()) {
        let movieTitle = withTitle.replacingOccurrences(of: " ", with: "+")
        let urlString = "http://www.omdbapi.com/?s=\(movieTitle)&r=json"
        guard let url = URL(string: urlString) else {return}
        let session = URLSession.shared
        
        let dataTask = session.dataTask(with: url) { (data, response, error) in
            if let jsonData = data {
                do {
                    var resultsArray = [MovieInfo]()
                    let jsonResponse = try JSONSerialization.jsonObject(with: jsonData, options: []) as! [String: Any]
                    //get to the array inside the search response loop through the array from each dict within, initialize a movie object
                    let searchResults = jsonResponse["Search"] as! [[String: String]]
                    for movie in searchResults {
                        let movieResult = MovieInfo(movie: movie)
                        print(movieResult.title)
                        print(movieResult.imdbID)
                        resultsArray.append(movieResult)
                    }
                    completion(resultsArray)
                    
                } catch {
                    
                }
            }
        }
        dataTask.resume()
    }
    
    class func getPoster(withURL: String, completion: @escaping (Data) -> ()) {
        guard let url = URL(string: withURL) else {return}
        let session = URLSession.shared
        let dataTask = session.dataTask(with: url) { (data, response, error) in
            guard let posterData = data else {return}
            completion(posterData)
        }
        dataTask.resume()
    }
    
    // added movieinfo to escaping below
    class func searchWithIMDB(withID: String, plotLength: String, completion: @escaping (MovieInfo) -> ()) {
        let urlString = "http://www.omdbapi.com/?i=\(withID)&plot=\(plotLength)&r=json"
        guard let url = URL(string: urlString) else {return}
        let session = URLSession.shared
        let dataTask = session.dataTask(with: url) { (data, response, error) in
            if let jsonData = data {
                do {
                    let jsonResponse = try JSONSerialization.jsonObject(with: jsonData, options: []) as! [String: String]
                    let movieResult = MovieInfo(movie: jsonResponse)
                    dump(movieResult)
                    completion(movieResult)
                    
                } catch {
                    
                }
            }
        }
        dataTask.resume()
    }
}
