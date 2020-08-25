//
//  AlertViewExtensions.swift
//  MoviesEnjazProject
//
//  Created by Ahmed Ayad on 8/25/20.
//  Copyright © 2020 ahmed ayad. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    func alert(title:String, messsage:String, buttonTitle:String? = "Ok", completion: (()-> Void)? = nil){
        
        let Alert = UIAlertController(title: title, message: messsage, preferredStyle: .alert)
        let deleteAction = UIAlertAction(title: buttonTitle, style: .default) { (action) in
            if let completion = completion {
                completion()
            }
        }
   
        Alert.addAction(deleteAction)
        self.present(Alert, animated: true, completion: nil)
    }
    
    
    
    func alertActionSheet(title:String, messsage:String, buttonTitle:String? = "Ok", completion: (()-> Void)? = nil){
          let Alert = UIAlertController(title: title, message: messsage, preferredStyle: .actionSheet)
          let okayAction = UIAlertAction(title: buttonTitle, style: .default) { (action) in
              if let completion = completion {
                  completion()
              }
          }
        let cancelButton = UIAlertAction(title: "Cancel", style: .cancel) { (delete) in
               print("cancelled")
           }
          Alert.addAction(okayAction)
          Alert.addAction(cancelButton)
          self.present(Alert, animated: true, completion: nil)
      }
    
}

