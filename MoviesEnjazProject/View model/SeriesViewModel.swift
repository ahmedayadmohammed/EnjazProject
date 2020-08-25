//
//  SeriesViewModel.swift
//  MoviesEnjazProject
//
//  Created by Ahmed Ayad on 8/25/20.
//  Copyright © 2020 ahmed ayad. All rights reserved.
//

import Foundation
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

struct SeriesListViewModle {
    let series: [SeriesResult]
    func numberOfRowsInSection(_ section: Int) -> Int {
        return self.series.count
    }
    
    func SeriesIndex(_ index: Int) -> SeriesViewModel {
        let serie = self.series[index]
        return SeriesViewModel(serie)
    }
    
    var numberOfSections: Int {
          return 1
      }
}
