//
//  GeneresViewModel.swift
//  MoviesEnjazProject
//
//  Created by Ahmed Ayad on 8/26/20.
//  Copyright © 2020 ahmed ayad. All rights reserved.
//

import Foundation
import UIKit

struct GenersViewModel {
    private let geners : Genre
}

extension GenersViewModel {
    init(_ gener : Genre) {
        self.geners = gener
    }
    
    var name : String {
        return self.geners.name ?? ""
    }
}


class GenersListViewModel {
    var delegate  : MoviesViewModelDelegate?
    var geners : [Genre]?
    
    init(geners : [Genre]){
        self.geners = geners
    }
    init(){
        
    }
    
    func binding(delegate:MoviesViewModelDelegate){
        self.delegate = delegate
    }
    
    func getGenersList(contoller : UIViewController) {
        GeneresServices.request.getGeners(viewController: contoller) { (geners) in
            if let genersList = geners {
                self.delegate?.genersLoadedSuccessfully(geners: genersList)
            }
        }
    }
    
    
    func numberOfRowsInSection(_ section: Int) -> Int {
        if let movieCount = self.geners?.count {
            return movieCount
        } else {
            return 0
        }
        
    }
    
    func genersIndex(_ index: Int) -> GenersViewModel? {
        if let movie = self.geners?[index] {
            return GenersViewModel(movie)
        }
        
        return nil
        
    }
    
    var numberOfSections: Int {
        return 1
    }
}
