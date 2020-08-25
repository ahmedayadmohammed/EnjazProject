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



class HomeTVC: UITableViewController {
    
    @IBOutlet weak var seriesCollection: UICollectionView!
    
    private var moviesData:[MovieFavorite]?
    private var movieListVM = MoviesListViewModle()
    private var seriesListVM = SeriesListViewModle()
    var Headerview : UIView!
    var NewHeaderLayer : CAShapeLayer!
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    let Headerheight : CGFloat = 333
    
    override func viewDidLoad() {
        super.viewDidLoad()
        movieListVM.binding(delegate: self)
        movieListVM.getMoviesList(controller: self)
        seriesListVM.binding(seriesDelegate: self)
        seriesListVM.getSeriesList(controller: self)
        configCollectionView()
        tableView.rowHeight = UITableView.automaticDimension
        
    }
    
    func configCollectionView(){
        seriesCollection.delegate = self
        seriesCollection.dataSource = self
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
        movieCell.movie = movieVM
        movieCell.delegate = self
        movieCell.indexPath = indexPath
        
        return movieCell
        
    }
    
}

extension HomeTVC : AddToFavorite {
    func addFavoriteMovies(indexPath: IndexPath) {
        let movieVM = self.movieListVM.movieIndex(indexPath.row)
        let newMovie = MovieFavorite(context: context)
        newMovie.language = movieVM?.originalLanguage
        newMovie.overview = movieVM?.overView
        newMovie.raring = (movieVM?.voteAverage ?? 0) - 3
        newMovie.releasedate = movieVM?.releaseDate
        newMovie.title = movieVM?.originalTitle
        newMovie.photo = movieVM?.posterPath
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
        seriesCell.series = seriesVM
        return seriesCell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.seriesListVM.numberOfRowsInSection(section)
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return self.seriesListVM == nil ? 0 : self.seriesListVM.numberOfSections
    }
    
    
}


extension HomeTVC : MoviesViewModelDelegate {
    func seriesLoadedSuccessfully(series: [SeriesResult]) {
        self.seriesListVM = SeriesListViewModle(series: series)
        self.seriesCollection.reloadData()
    }
    
    func moviesLoadedSuccessfully(movies: [MoviesResults]) {
        self.movieListVM = MoviesListViewModle(movies: movies)
        self.tableView.reloadData()
    }
    
    
}
