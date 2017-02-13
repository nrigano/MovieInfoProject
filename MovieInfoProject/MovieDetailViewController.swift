//
//  MovieDetailViewController.swift
//  MovieInfoProject
//
//  Created by Nick on 2/11/17.
//  Copyright © 2017 Nick. All rights reserved.
//

import Foundation
import UIKit

class MovieDetailViewController: UIViewController {
    
    var movie: MovieInfo?
    var nameLabel = UIImageView()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("Segue complete!")
        if let movie = movie {
            print(movie.title)
        }
        
    
    }
}


// next: create movie detail view.  then make picture appear.  Then on to core data to save movies.  need to add button to save to core data: need an empty star and a full star.  could also use blank circle/full circle or something.  Is it better to do everything in the VWA or to do it all in a funciton and call the function?
