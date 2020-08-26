//
//  ImageServices.swift
//  MoviesEnjazProject
//
//  Created by Ahmed Ayad on 8/25/20.
//  Copyright © 2020 ahmed ayad. All rights reserved.
//

import Foundation
import Kingfisher
import UIKit

func getImage (image:UIImageView,cellUrl:String) {
    let processor = DownsamplingImageProcessor(size: image.frame.size)  |>
        RoundCornerImageProcessor(cornerRadius: 0)
    image.kf.setImage(with: URL(string:"https://image.tmdb.org/t/p/w500\(cellUrl)"), placeholder: UIImage(named: "bOKjzWDxiDkgEQznhzP4kdeAHNI"),options: [
        .processor(processor),
        .scaleFactor(UIScreen.main.scale),
        .transition(.fade(1)),
        .cacheOriginalImage
    ])
}
