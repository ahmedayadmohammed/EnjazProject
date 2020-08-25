//
//  ShadowExtension.swift
//  MoviesEnjazProject
//
//  Created by Ahmed Ayad on 8/25/20.
//  Copyright © 2020 ahmed ayad. All rights reserved.
//

import Foundation
import UIKit
extension UIView {
    
    public  func addShadow(shadowColor: CGColor = UIColor.gray.cgColor,
                           shadowOffset: CGSize = CGSize(width: 0, height: 1),
                           shadowOpacity: Float = 0.2,
                           shadowRadius: CGFloat = 4.0) {
        layer.shadowColor = shadowColor
        layer.shadowOffset = shadowOffset
        layer.shadowOpacity = shadowOpacity
        layer.shadowRadius = shadowRadius
        layer.masksToBounds = false
    }
    
    public  func roundCorners(_ corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
    }
    
    public  func addWhiteShadow(shadowColor: CGColor = UIColor.lightGray.cgColor,
                                shadowOffset: CGSize = CGSize(width: 0, height: 1),
                                shadowOpacity: Float = 0.2,
                                shadowRadius: CGFloat = 7.0) {
        layer.shadowColor = shadowColor
        layer.shadowOffset = shadowOffset
        layer.shadowOpacity = shadowOpacity
        layer.shadowRadius = shadowRadius
        layer.masksToBounds = true
    }
}

