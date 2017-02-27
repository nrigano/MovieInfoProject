//
//  FavButton.swift
//  MovieInfoProject
//
//  Created by Nick on 2/23/17.
//  Copyright © 2017 Nick. All rights reserved.
//

import UIKit

protocol FavButtonDelegate {
    func favButtonTapped(_ button: FavButton, isFavorited: Bool)
}

class FavButton: UIButton {
    
    var delegate: FavButtonDelegate?
    
    var isFavorited: Bool = false {
        didSet {
            setTitle(isFavorited ? "🔴" : "⭕️" , for: .normal)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    convenience init() {
        self.init(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        commonInit()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    func commonInit() {
        setTitle("⭕️", for: .normal)
        addTarget(self, action: #selector(handleSelection), for: .touchUpInside)
        isUserInteractionEnabled = true
        backgroundColor = UIColor.getRandomColor()
    }
    
    func handleSelection() {
        isFavorited = !isFavorited
        delegate?.favButtonTapped(self, isFavorited: isFavorited)
    }
    
  
    


}
