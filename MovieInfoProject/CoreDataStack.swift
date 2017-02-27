//
//  CoreDataStack.swift
//  MovieInfoProject
//
//  Created by Nick on 2/21/17.
//  Copyright © 2017 Nick. All rights reserved.
//

import Foundation
import CoreData

final class CoreDataStack {
    
    static let shared = CoreDataStack()
    
    // store (like in a bin)
    
    // save (how can we save them in our store?
    
    //fetch (hey go get that thing)
    private static let name = "FaveModel"
    
    var context: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    //Lazy only executes once the first time it's called; afterward you get the result of the first call?
    //use code below for managing CoreData in future
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: CoreDataStack.name)
        
        container.loadPersistentStores { storeDescription, error in
            if let error = error as NSError? {
                print("Error: \(error.userInfo)")
            }
        }
        return container
    }()
    
    func saveContext() {
        let context = persistentContainer.viewContext
        
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                print("Unresolved error: \(nserror), \(nserror.userInfo)")
                
            }
        }
    }
    
    
    
    
    
}
