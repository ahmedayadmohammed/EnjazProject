//
//  GenersCell.swift
//  MoviesEnjazProject
//
//  Created by Ahmed Ayad on 8/26/20.
//  Copyright © 2020 ahmed ayad. All rights reserved.
//

import UIKit

class GenersCell: UICollectionViewCell {
    
    @IBOutlet weak var nameView: UIView!
    @IBOutlet weak var genersName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        nameView.layer.cornerRadius = 4
    }
    
    var geners : GenersViewModel? {
        didSet {
            setUpData()
        }
    }
    
    
    func setUpData(){
        genersName.text = geners?.name
    }
    
    
}
