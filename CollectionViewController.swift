//
//  CollectionViewController.swift
//  MovieInfoProject
//
//  Created by Nick on 2/2/17.
//  Copyright © 2017 Nick. All rights reserved.
//

import Foundation
import UIKit

class UICollectionViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    //number of items in section should be based on search results.  So I should call that here?
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 12
    }
    
    
    //So here I want to define each cell and populate based on search.
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "resultsCell", for: indexPath)
        
        cell.backgroundColor = UIColor.getRandomColor()
        return cell
    }

    
    


}
