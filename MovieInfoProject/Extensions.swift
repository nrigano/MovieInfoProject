//
//  Extensions.swift
//  MovieInfoProject
//
//  Created by Nick on 3/2/17.
//  Copyright © 2017 Nick. All rights reserved.
//

import Foundation
import CoreData

extension Fave {
    class var fetch: NSFetchRequest<Fave> {
        return NSFetchRequest<Fave>(entityName: "Fave")
    }
    public override var description: String {
        return "\(imdbID)"
    }
}
