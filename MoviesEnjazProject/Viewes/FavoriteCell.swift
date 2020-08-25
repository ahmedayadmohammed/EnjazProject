//
//  FavoriteCell.swift
//  MoviesEnjazProject
//
//  Created by Ahmed Ayad on 8/25/20.
//  Copyright © 2020 ahmed ayad. All rights reserved.
//

import UIKit
import Cosmos
class FavoriteCell: UITableViewCell {
    
    @IBOutlet weak var movieDescription: UILabel!
    @IBOutlet weak var movieReleaseDate: UILabel!
    @IBOutlet weak var movieRating: CosmosView!
    @IBOutlet weak var movieLanguage: UILabel!
    @IBOutlet weak var movieName: UILabel!
    @IBOutlet weak var moviePhoto: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
       moviePhoto.layer.cornerRadius = 4
       moviePhoto.addWhiteShadow()
  
    }



}
