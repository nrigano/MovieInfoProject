//
//  MovieDetailViewController.swift
//  MovieInfoProject
//
//  Created by Nick on 2/11/17.
//  Copyright © 2017 Nick. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class MovieDetailViewController: UIViewController {
    
    var movie: MovieInfo?
    //    var nameLabel = UIImageView()
    var yearLabel = UILabel()
    var plotLabel = UILabel()
    var directorLabel = UILabel()
    var writerLabel = UILabel()
    var starringLabel = UILabel()
    var imdbLabel = UILabel()
    var metaLabel = UILabel()
    var ratingLabel = UILabel()
    var runtimeLabel = UILabel()
    var genreLabel = UILabel()
    var faveButton = FavButton()
    let coreDataStack = CoreDataStack.shared
    
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        view.backgroundColor = UIColor.getRandomColor()
        
        print("Segue complete!")
        //        if let movie = movie {
        //            print(movie.title)
        //            navigationItem.title = movie.title
        //            createViews()
        //        }
        
        
        if let movie = movie {
            print(movie.title)
            navigationItem.title = movie.title
            getMovieDetails()
        }
        
        
    }
    
    func getMovieDetails() {
        APIClient.searchWithIMDB(withID: (movie?.imdbID)!, plotLength: "full") { (movieResult) in
            self.movie = movieResult
            OperationQueue.main.addOperation {
                self.createViews()
            }
            
        }
        
    }
    
    
    
    
    func createViews() {
        
        
        //Create scrollview here
        dump(movie)
        view.addSubview(plotLabel)
        plotLabel.text = "PLOT: \(movie!.plot)"
        plotLabel.translatesAutoresizingMaskIntoConstraints = false
        plotLabel.layer.masksToBounds = true
        plotLabel.backgroundColor = UIColor.getRandomColor()
        plotLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 50).isActive = true
        plotLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        plotLabel.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -30).isActive = true
        plotLabel.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.1).isActive = true
        
        view.addSubview(yearLabel)
        yearLabel.text = "RELEASED: \(movie!.year)"
        yearLabel.translatesAutoresizingMaskIntoConstraints = false
        yearLabel.backgroundColor = UIColor.getRandomColor()
        yearLabel.topAnchor.constraint(equalTo: plotLabel.bottomAnchor, constant: 15).isActive = true
        yearLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        yearLabel.widthAnchor.constraint(equalTo: view.widthAnchor, constant: 0).isActive = true
        yearLabel.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.1).isActive = true
        
        view.addSubview(genreLabel)
        genreLabel.text = movie!.genre
        genreLabel.translatesAutoresizingMaskIntoConstraints = false
        genreLabel.backgroundColor = UIColor.getRandomColor()
        genreLabel.topAnchor.constraint(equalTo: yearLabel.bottomAnchor, constant: 15).isActive = true
        //        genreLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        genreLabel.widthAnchor.constraint(equalTo: view.widthAnchor, constant: 0).isActive = true
        genreLabel.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.1).isActive = true
        
        view.addSubview(faveButton)
        faveButton.translatesAutoresizingMaskIntoConstraints = false
        faveButton.topAnchor.constraint(equalTo: genreLabel.bottomAnchor, constant: 15).isActive = true
        faveButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.1).isActive = true
        faveButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.1).isActive = true
        faveButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        faveButton.delegate = self
        
    }
    
}

extension MovieDetailViewController: FavButtonDelegate {
    
    func favButtonTapped(_ button: FavButton, isFavorited: Bool) {
        
        
        print("isFavorited is tapped: \(isFavorited)")
        
        // react to that.
        
        
        //let testTask = Task(context: coreDataStack.context)
        
        ///let testFave = Fave(entity: NSEntityDescription.entity(forEntityName: "Fave", in: coreDataStack.context)!, insertInto: coreDataStack.context)
        let newFave = Fave(context: coreDataStack.context)
//        newFave.name = ""
//        newFave.actors = ""
//        newFave.director = ""
//        newFave.imdbID = ""
//        newFave.posterThumbnail = ""
//        newFave.writer = ""
       newFave.title = ""
        coreDataStack.saveContext()
        
       // print(newFave.imdbID)
    }
}
