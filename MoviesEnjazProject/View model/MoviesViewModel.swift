//
//  MoviesViewModel.swift
//  MoviesEnjazProject
//
//  Created by Ahmed Ayad on 8/25/20.
//  Copyright © 2020 ahmed ayad. All rights reserved.
//

import Foundation
import UIKit

protocol MoviesViewModelDelegate {
    func moviesLoadedSuccessfully(movies:[MoviesResults])
    func seriesLoadedSuccessfully(series:[SeriesResult])
    func genersLoadedSuccessfully(geners:[Genre])
}

struct MovieViewModel {
    private let movie : MoviesResults
    
}

extension MovieViewModel {
    init(_ movie:MoviesResults) {
        self.movie = movie
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

class MoviesListViewModle {
    var delegate : MoviesViewModelDelegate?
    
    var movies: [MoviesResults]?
    
    init(movies : [MoviesResults]) {
        self.movies = movies
    }
    init() {}
    
    func bindDelegate(delegate :MoviesViewModelDelegate ){
        self.delegate = delegate
    }
    
     func getMoviesList(controller :UIViewController){
        MoviesApiRequest.request.getMovies(viewController: controller) { (data) in
            if let movieList = data {
                self.delegate?.moviesLoadedSuccessfully(movies: movieList)
                
            }
        }
    }
    
    
    func numberOfRowsInSection(_ section: Int) -> Int {
        if let movieCount = self.movies?.count {
            return movieCount
        } else {
            return 0
        }
    }
    
    func movieIndex(_ index: Int) -> MovieViewModel? {
        if let movie = self.movies?[index] {
            return MovieViewModel(movie)
        }
        return nil
    }
    
    var numberOfSections: Int {
        return 1
    }
}
