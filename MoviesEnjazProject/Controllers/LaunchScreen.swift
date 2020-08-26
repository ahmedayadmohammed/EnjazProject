//
//  LaunchScreen.swift
//  MoviesEnjazProject
//
//  Created by Ahmed Ayad on 8/26/20.
//  Copyright © 2020 ahmed ayad. All rights reserved.
//

import UIKit

class StarterVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUserInterfaceScreen()
    }
    
    
    func setUserInterfaceScreen () {
        if let entered = UserDefaults.standard.string(forKey: "Entered") {
            if entered != "" {
                let homeTab = storyboard?.instantiateViewController(withIdentifier: "TabBarHome") as! TabBarHome
                homeTab.modalPresentationStyle = .fullScreen
                self.present(homeTab, animated: true, completion: nil)
                
            } else {
                 let homeTab = storyboard?.instantiateViewController(withIdentifier: "TabBarHome") as! TabBarHome
                homeTab.modalPresentationStyle = .fullScreen
                self.present(homeTab, animated: true, completion: nil)
                
            }
        }
    }
    
    
    
    
}
