//
//  HandyTools.swift
//  MoviesEnjazProject
//
//  Created by Ahmed Ayad on 8/25/20.
//  Copyright © 2020 ahmed ayad. All rights reserved.
//

import Foundation
import UIKit
import SnapKit
class Tools {
    
  static  func createNoConnView(vc: UIViewController, title: String){
    let label = UILabel()
    label.frame = CGRect(x: 10, y: vc.view.frame.origin.y, width: vc.view.frame.width, height: 90)
    label.center.x = vc.view.center.x
    label.textAlignment = .center
    label.textColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
    label.font = UIFont(name: MovieFonts.AvenirNextRegular.rawValue, size: 22)
    label.numberOfLines = 2
    label.text = title
    vc.view.addSubview(label)
    label.snp.makeConstraints { (make) in
        make.centerX.equalToSuperview()
        make.centerY.equalToSuperview().multipliedBy(0.9)
        make.width.equalTo(vc.view.frame.width)
    }
    
}
}


