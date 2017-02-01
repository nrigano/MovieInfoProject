//
//  ViewController.swift
//  MovieInfoProject
//
//  Created by Nick on 1/30/17.
//  Copyright © 2017 Nick. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        APIClient.searchDB(withTitle: "lebowski") {
        
        }
        APIClient.searchWithIMDB(withID: "tt0076759", plotLength: "short") {
            
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

