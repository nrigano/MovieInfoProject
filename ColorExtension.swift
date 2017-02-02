//
//  ColorExtension.swift
//  MovieInfoProject
//
//  Created by Nick on 2/2/17.
//  Copyright © 2017 Nick. All rights reserved.
//

import Foundation
import UIKit


extension UIColor{
    
    class func getRandomColor() -> UIColor{
        
        let red = CGFloat(drand48())
        let green = CGFloat(drand48())
        let blue = CGFloat(drand48())
        return UIColor(red: red, green: green, blue: blue, alpha: 1.0)
        
    }
    
}
