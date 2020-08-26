//
//  SeriesCellCollectionViewCell.swift
//  MoviesEnjazProject
//
//  Created by Ahmed Ayad on 8/24/20.
//  Copyright © 2020 ahmed ayad. All rights reserved.
//

import UIKit
import Cosmos
class SeriesCell: UICollectionViewCell {
    
    @IBOutlet weak var seriesPhoto: UIImageView!
    @IBOutlet weak var SeriesName: UILabel!
    @IBOutlet weak var releaseDate: UILabel!
    @IBOutlet weak var seriesRate: CosmosView!
    
    var series : SeriesViewModel? {
        didSet {
            setUpData()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
       seriesPhoto.layer.cornerRadius = 4
    }
    
    func setUpData(){
        SeriesName.text = series?.name
        releaseDate.text = series?.date
        seriesRate.rating = (series?.vote ?? 0.0) - 3
        getImage(image: seriesPhoto, cellUrl: series?.photo ?? "")
    }
    
  
    
    
}
