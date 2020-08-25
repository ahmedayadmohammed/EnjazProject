//
//  MoviesViewModel.swift
//  MoviesEnjazProject
//
//  Created by Ahmed Ayad on 8/25/20.
//  Copyright © 2020 ahmed ayad. All rights reserved.
//

import Foundation
struct MovieViewModel {
    private let movie : Result
    
}

extension MovieViewModel {
    init(_ movie:Result) {
        self.movie = movie
    }
    
    var popularity : Double{
        return self.movie.popularity ?? 0.0
    }
    var voteCount : Int {
        return self.movie.voteCount ?? 0
    }
    var posterPath : String {
        return self.movie.posterPath ?? ""
    }
    var adult : Bool {
        return self.movie.adult ?? true
    }
    var backdropPath : String {
        return self.movie.backdropPath ?? ""
    }
    var originalTitle : String {
        return self.movie.originalTitle ?? ""
    }
    var title : String {
        return self.movie.title ?? ""
    }
    var voteAverage : Double {
        return self.movie.voteAverage ?? 0.0
    }
    var overView : String {
        return self.movie.overview ?? "Nothing there"
    }
    var releaseDate : String {
        return self.movie.releaseDate ?? "No date"
    }
    var originalLanguage : String {
        return self.movie.originalLanguage ?? ""
    }
    var id : Int {
        return self.movie.id ?? 0
    }
    
}

struct MoviesListViewModle {
    let movies: [Result]
    func numberOfRowsInSection(_ section: Int) -> Int {
        return self.movies.count
    }
    
    func movieIndex(_ index: Int) -> MovieViewModel {
        let movie = self.movies[index]
        return MovieViewModel(movie)
    }
    
    var numberOfSections: Int {
          return 1
      }
}
