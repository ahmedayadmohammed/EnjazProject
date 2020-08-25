//
//  HomeTVC.swift
//  MoviesEnjazProject
//
//  Created by Ahmed Ayad on 8/24/20.
//  Copyright © 2020 ahmed ayad. All rights reserved.
//

import UIKit
import Kingfisher
import CoreData

typealias seriesMethods = UICollectionViewDelegate & UICollectionViewDataSource
class HomeTVC: UITableViewController {
    
    @IBOutlet weak var seriesCollection: UICollectionView!
    
    private var moviesData:[MovieFavorite]?
    private var movieListVM : MoviesListViewModle!
    private var seriesListVM : SeriesListViewModle!
    var Headerview : UIView!
    var NewHeaderLayer : CAShapeLayer!
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let Headerheight : CGFloat = 333
    
    override func viewDidLoad() {
        super.viewDidLoad()
        delegatesSeries()
        tableView.rowHeight = UITableView.automaticDimension
        getMoviesList()
        getSeriesList()
    }
    
    func delegatesSeries(){
        seriesCollection.delegate = self
        seriesCollection.dataSource = self
    }
    
    
    func getMoviesList(){
        MoviesApiRequest.request.getMovies(viewController: self) {[weak self] (data) in
            if let movieList = data {
                self?.movieListVM = MoviesListViewModle(movies: movieList)
                self?.tableView.reloadData()
            }
        }
    }
    
    
    func getSeriesList(){
        SeriesApiRequest.request.getSeries(viewController: self) {[weak self] (series) in
            if let seriesList = series {
                self?.seriesListVM = SeriesListViewModle(series: seriesList)
                self?.seriesCollection.reloadData()
            }
        }
    }
    
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return self.movieListVM == nil ? 0 : self.movieListVM.numberOfSections
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.movieListVM.numberOfRowsInSection(section)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let movieCell = tableView.dequeueReusableCell(withIdentifier: "MoviesCell", for: indexPath) as? MoviesCell else {
            fatalError("MoviesCell not found")
        }
        let movieVM = self.movieListVM.movieIndex(indexPath.row)
        movieCell.movieName.text = movieVM.originalTitle
        movieCell.movieLanguage.text = movieVM.originalLanguage
        movieCell.moviesDescription.text = movieVM.overView
        movieCell.movieRating.rating = movieVM.voteAverage - 3
        movieCell.movieReleaseDate.text = movieVM.releaseDate
        movieCell.delegate = self
        movieCell.indexPath = indexPath
        getImage(image: movieCell.moviePhoto, cellUrl: movieVM.posterPath)
        
        return movieCell
        
    }
    
    
    
}

extension HomeTVC : AddToFavorite {
    func addFavoriteMovies(indexPath: IndexPath) {
        let movieVM = self.movieListVM.movieIndex(indexPath.row)
        let newMovie = MovieFavorite(context: context)
        newMovie.language = movieVM.originalLanguage
        newMovie.overview = movieVM.overView
        newMovie.raring = movieVM.voteAverage - 3
        newMovie.releasedate = movieVM.releaseDate
        newMovie.title = movieVM.originalTitle
        newMovie.photo = movieVM.posterPath
        do {
            try self.context.save()
        } catch {
            print("erro in saving the data")
        }
    }
    
    
}


extension HomeTVC : seriesMethods {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let seriesCell : SeriesCell = collectionView.dequeueReusableCell(withReuseIdentifier: "SeriesCell", for: indexPath) as! SeriesCell
        let seriesVM = self.seriesListVM.SeriesIndex(indexPath.row)
        seriesCell.SeriesName.text = seriesVM.name
        seriesCell.releaseDate.text = seriesVM.date
        seriesCell.seriesRate.rating = seriesVM.vote - 3
        getImage(image: seriesCell.seriesPhoto, cellUrl: seriesVM.photo)
        
        return seriesCell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.seriesListVM.numberOfRowsInSection(section)
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return self.seriesListVM == nil ? 0 : self.seriesListVM.numberOfSections
    }
    
    
}
