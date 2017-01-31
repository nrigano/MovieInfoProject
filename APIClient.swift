//
//  APIClient.swift
//  MovieInfoProject
//
//  Created by Nick on 1/30/17.
//  Copyright © 2017 Nick. All rights reserved.
//

import Foundation

class APIClient {
    func searchDB(withTitle: String, plotLength: String, completion: @escaping () -> ()) {
        //gonna have to split up search word by word.  "Star Wars" into star+wars.  Yes.  How did you solve this problem before?
        //{ [{}, {}, {}]}
        //next: make sure you're calling for the information above.  Each movie is a dictionary inside an array insiade a dictioanry.  Format correctly and check in console
        //make a movie class: title, year, imdbID, type, poster.
        //make an enum: short or long plot summary
        
        let urlString = "http://www.omdbapi.com/?s=star+wars&y=&plot=short&r=json"
        guard let url = URL(string: urlString) else {return}
        let session = URLSession.shared
        
        let dataTask = session.dataTask(with: url) { (data, response, error) in
            if let jsonData = data {
                do {
                    let jsonResponse = try
                    JSONSerialization.jsonObject(with: jsonData, options: []) as! [String: Any]
                }
            }
        }
        
    }
}
