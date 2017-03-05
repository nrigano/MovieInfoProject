//
//  MovieDataStore.swift
//  MovieInfoProject
//
//  Created by Nick on 3/2/17.
//  Copyright © 2017 Nick. All rights reserved.
//

import Foundation
import CoreData

class MovieDataStore {
    static let sharedInstance = MovieDataStore()
    private init() {}
    
    var fetchedMovies = [MovieInfo]()
    var savedMovies = [Fave]()
    var coreDataStack = CoreDataStack.shared
    
    
    func fetchMovies(title:String, completion:@escaping ()->()) {
        self.fetchedMovies.removeAll()
        APIClient.searchDB(withTitle: title) { (movies) in
            self.fetchedMovies = movies
            completion()
        }
        
        Fave.fetch
//        CoreDataStack.shared.context.fetch(<#T##request: NSFetchRequest<NSFetchRequestResult>##NSFetchRequest<NSFetchRequestResult>#>)
    }
    
    func fetchFaves() {
        self.savedMovies.removeAll()
        savedMovies = try! coreDataStack.context.fetch(Fave.fetch)
        print(savedMovies)
        
    }
    
    //where do I put the extension and override the damn description?  Seem to be building an array in the moviedatastore...but it's not avilable anywhere else.  If I can access the damn array, then I can build the damn tabelview.  And fill out the damn tab controller.  Then I can remove shit from the array with the button.  And once I can do that, I can clean this dumb fucker up and put it up on the damn app store.
    
    
    func checkFaves(movie: MovieInfo) -> Bool {
        for fave in savedMovies {
            if fave.imdbID == movie.imdbID {
                print("Favorited")
                return true
            }
            else {
                print("Not a favorite")
                return false
            }
        }
        return false
    }
    
}
