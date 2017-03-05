//
//  MovieViewController.swift
//  MovieInfoProject
//
//  Created by Nick on 2/2/17.
//  Copyright © 2017 Nick. All rights reserved.
//

//build a listview based off fetchedMovies? I don't even fucking know

import Foundation
import UIKit

class MovieViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    private let resultsCellReuse = "resultsCell"
    private var collectionView: UICollectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout())
    private var movieArray = [MovieInfo]()
    
    
    var store = MovieDataStore.sharedInstance
    let coreDataStack = CoreDataStack.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("I'm running!")

        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.collectionView.backgroundColor = UIColor.getRandomColor()
        
        self.collectionView.register(MovieCollectionViewCell.self, forCellWithReuseIdentifier: resultsCellReuse)
        
        self.view.addSubview(self.collectionView)
        let frame = self.view.frame
        self.collectionView.frame = frame
        APIClient.searchDB(withTitle: "lebowski") {resultsArray in
            self.movieArray = resultsArray
            OperationQueue.main.addOperation {
                self.collectionView.reloadData()
            }
        }
        
        store.fetchMovies(title: "lebowski") {
            self.collectionView.reloadData()
        }
    
    }
    
    
    //number of items in section should be based on search results.  So I should call that here?
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movieArray.count
    }
    
    
    //So here I want to define each cell and populate based on search.
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "resultsCell", for: indexPath) as! MovieCollectionViewCell
        
        cell.backgroundColor = UIColor.getRandomColor()
        let movie = movieArray[indexPath.item]
        
        if let posterURL = movie.poster {
            
            APIClient.getPoster(withURL: posterURL) { (posterGotten) in
                let image = UIImage(data: posterGotten)
                OperationQueue.main.addOperation {
                    cell.imageView.image = image
                }
                
            }
            
        } else {
            
            // provide default image here.
        }
        
        
        
        
        return cell
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 136, height: 200) // Cell size
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let frame: CGRect = self.view.frame
        let margin = (frame.width - 50 * 3) / 6.0
        return UIEdgeInsetsMake(10, margin, 10, margin)

    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        var movieDetailViewController = MovieDetailViewController()
        movieDetailViewController.movie = movieArray[indexPath.item]
        self.navigationController?.pushViewController(movieDetailViewController, animated: true)
    }
}
