//
//  FavoritesListViewController.swift
//  MovieInfoProject
//
//  Created by Nick on 3/1/17.
//  Copyright © 2017 Nick. All rights reserved.
//

import Foundation
import UIKit

class FavoritesListViewController: UITableViewController {
    
    var store = MovieDataStore.sharedInstance
    var coreDataStack = CoreDataStack.shared

    override func viewDidLoad() {
        super.viewDidLoad()
        store.fetchFaves()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return favoritedMovies.count
        return store.savedMovies.count
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "faveCell", for: indexPath)
        let chosenMovie = store.savedMovies[indexPath.row]
        cell.backgroundColor = UIColor.getRandomColor()
        cell.textLabel?.text = chosenMovie.title
        return cell
    }
    
    func 
    
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier != "MovieDetailView" { return }
//        if let dest = segue.destination as? MovieDetailViewController,
//            let indexPath = tableView.indexPathForSelectedRow {
//            
//            
//        }
    
    
        
//
//        var movieDetailViewController = MovieDetailViewController()
//        movieDetailViewController.movie = store.savedMovies
//        self.navigationController?.pushViewController(movieDetailViewController, animated: true)
        
//    }
    
    
    
    
    
}
