//
//  LaunchScreen.swift
//  MoviesEnjazProject
//
//  Created by Ahmed Ayad on 8/26/20.
//  Copyright © 2020 ahmed ayad. All rights reserved.
//

import UIKit
import SwiftKeychainWrapper

class StarterVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUserInterfaceScreen()
    }
    
    
    func setUserInterfaceScreen () {
        Tools.getData(key: "entered") { (data) in
            if data != "" {
                Tools.goToHomeVc(vc: self)
            }else {
                Tools.goToSplashScreen(vc: self)
            }
        }
    }
    
    
    
    
}
