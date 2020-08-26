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
import Reachability

class HomeTVC: UITableViewController {
    
    @IBOutlet weak var generesCollectionView: UICollectionView!
    @IBOutlet weak var seriesCollection: UICollectionView!
    
    private var moviesData:[MovieFavorite]?
    private var movieListVM = MoviesListViewModle()
    private var seriesListVM = SeriesListViewModle()
    private var genersListVM = GenersListViewModel()
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    let reachability = try! Reachability()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        movieListVM.bindDelegate(delegate: self)
        seriesListVM.binding(seriesDelegate: self)
        genersListVM.binding(delegate: self)
        configCollectionView()
        tableView.rowHeight = UITableView.automaticDimension
        setLanguageDirection()
    }
    
    func configCollectionView(){
        seriesCollection.delegate = self
        seriesCollection.dataSource = self
        generesCollectionView.delegate = self
        generesCollectionView.dataSource = self
    }
    
    
    func setLanguageDirection(){
        if localize == "ar" {
             UIView.appearance().semanticContentAttribute = .forceRightToLeft
        }else {
             UIView.appearance().semanticContentAttribute = .forceLeftToRight
        }
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        NotificationCenter.default.addObserver(self, selector: #selector(reachabilityChanged(note:)), name: .reachabilityChanged, object: reachability)
        do{
            try reachability.startNotifier()
        }catch{
            print("could not start reachability notifier")
        }
        
    }
    
    @objc func reachabilityChanged(note: Notification) {
        let reachability = note.object as! Reachability
        switch reachability.connection {
        case .wifi:
            genersListVM.getGenersList(contoller: self)
            movieListVM.getMoviesList(controller: self)
            seriesListVM.getSeriesList(controller: self)
        case .cellular:
            genersListVM.getGenersList(contoller: self)
            movieListVM.getMoviesList(controller: self)
            seriesListVM.getSeriesList(controller: self)
        case .unavailable:
            self.alert(title: "Network Error", messsage: "There is no network please check your internet connection")
        default:break
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
        
        if collectionView == collectionView.viewWithTag(1){
            let seriesCell : SeriesCell = collectionView.dequeueReusableCell(withReuseIdentifier: "SeriesCell", for: indexPath) as! SeriesCell
            let seriesVM = self.seriesListVM.SeriesIndex(indexPath.row)
            seriesCell.series = seriesVM
            return seriesCell
        } else {
            let generesCell : GenersCell = collectionView.dequeueReusableCell(withReuseIdentifier: "GenersCell", for: indexPath) as! GenersCell
            let genersVM = self.genersListVM.genersIndex(indexPath.row)
            generesCell.geners = genersVM
            return generesCell
        }
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == collectionView.viewWithTag(1) {
            return self.seriesListVM.numberOfRowsInSection(section)
        } else {
            return self.genersListVM.numberOfRowsInSection(section)
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        if collectionView == collectionView.viewWithTag(1) {
            return self.seriesListVM == nil ? 0 : self.seriesListVM.numberOfSections
        } else {
            return self.genersListVM == nil ?0 : self.genersListVM.numberOfSections
        }
    }
    
}


extension HomeTVC : MoviesViewModelDelegate {
    func genersLoadedSuccessfully(geners: [Genre]) {
        self.genersListVM = GenersListViewModel(geners: geners)
        self.generesCollectionView.reloadData()
    }
    
    func seriesLoadedSuccessfully(series: [SeriesResult]) {
        self.seriesListVM = SeriesListViewModle(series: series)
        self.seriesCollection.reloadData()
    }
    
    func moviesLoadedSuccessfully(movies: [MoviesResults]) {
        self.movieListVM = MoviesListViewModle(movies: movies)
        self.tableView.reloadData()
    }
    
    
}
