//
//  APIClient.swift
//  MovieInfoProject
//
//  Created by Nick on 1/30/17.
//  Copyright © 2017 Nick. All rights reserved.
//

import Foundation

class APIClient {
    class func searchDB(withTitle: String, plotLength: String, completion: @escaping () -> ()) {
        //gonna have to split up search word by word.  "Star Wars" into star+wars.  Yes.  How did you solve this problem before?
        //{ [{}, {}, {}]}
        //next: make sure you're calling for the information above.  Each movie is a dictionary inside an array insiade a dictioanry.  Format correctly and check in console
        //make an enum: short or long plot summary
        
        let urlString = "http://www.omdbapi.com/?s=star+wars&y=&plot=short&r=json"
        guard let url = URL(string: urlString) else {return}
        let session = URLSession.shared
        
        let dataTask = session.dataTask(with: url) { (data, response, error) in
            if let jsonData = data {
                do {
                    let jsonResponse = try JSONSerialization.jsonObject(with: jsonData, options: []) as! [String: Any]
                    //get to the array inside the search response loop through the array from each dict within, initialize a movie object
                    let searchResults = jsonResponse["Search"] as! [[String: String]]
                    for movie in searchResults {
                        let movieResult = MovieInfo(movie: movie)
                        print(movieResult.title)
                    }
                    
                } catch {
                    
                }
                
                
            }
        }
        dataTask.resume()
    }
}
