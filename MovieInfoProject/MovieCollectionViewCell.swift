//
//  MovieCollectionViewCell.swift
//  MovieInfoProject
//
//  Created by Nick on 2/16/17.
//  Copyright © 2017 Nick. All rights reserved.
//

import UIKit

class MovieCollectionViewCell: UICollectionViewCell {
    var imageView: UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        print("got a pic?")
        imageView = UIImageView(frame: CGRect.zero)
        imageView.backgroundColor = UIColor.blue
        
        contentView.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
       // imageView.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor).isActive = true
        imageView.leftAnchor.constraint(equalTo: self.contentView.leftAnchor).isActive = true
        imageView.topAnchor.constraint(equalTo: self.contentView.topAnchor).isActive = true
        imageView.heightAnchor.constraint(equalTo: self.contentView.heightAnchor).isActive = true
        imageView.widthAnchor.constraint(equalTo: self.contentView.widthAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
