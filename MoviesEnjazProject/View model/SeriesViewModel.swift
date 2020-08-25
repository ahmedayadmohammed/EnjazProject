//
//  SeriesViewModel.swift
//  MoviesEnjazProject
//
//  Created by Ahmed Ayad on 8/25/20.
//  Copyright © 2020 ahmed ayad. All rights reserved.
//

import Foundation
import UIKit

struct SeriesViewModel {
    private let series : SeriesResult
}

extension SeriesViewModel {
    init(_ series : SeriesResult) {
        self.series = series
    }
    
    var name : String {
        return self.series.name ?? ""
    }
    var vote: Double {
        return self.series.voteAverage ?? 0.0
    }
    var photo : String {
        return self.series.posterPath ?? ""
    }
    var date : String {
        return self.series.firstAirDate ?? ""
    }
}

class SeriesListViewModle {
    var delegate : MoviesViewModelDelegate?
    var series: [SeriesResult]?
    
    init (series : [SeriesResult]) {
        self.series = series
    }
    init(){
        
    }
    
    func binding(seriesDelegate : MoviesViewModelDelegate) {
        self.delegate = seriesDelegate
    }
    
    func getSeriesList(controller:UIViewController){
         SeriesApiRequest.request.getSeries(viewController: controller) {(series) in
             if let seriesList = series {
                self.delegate?.seriesLoadedSuccessfully(series: seriesList)
            
             }
         }
     }
    
    func numberOfRowsInSection(_ section: Int) -> Int {
        if let seriesCount = self.series?.count {
           return seriesCount
        } else {
            return 0
        }
        
    }
    
    func SeriesIndex(_ index: Int) -> SeriesViewModel? {
        if let serie = self.series?[index] {
            return SeriesViewModel(serie)
        }
        return nil
    }
    
    var numberOfSections: Int {
          return 1
      }
}
