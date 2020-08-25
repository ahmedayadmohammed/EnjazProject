//
//  MoviesCell.swift
//  MoviesEnjazProject
//
//  Created by Ahmed Ayad on 8/24/20.
//  Copyright © 2020 ahmed ayad. All rights reserved.
//

import UIKit
import Cosmos
import Kingfisher
import RxGesture
import RxSwift

class MoviesCell: UITableViewCell {
    
    @IBOutlet weak var likeImage: UIImageView!
    @IBOutlet weak var moviePhoto: UIImageView!
    @IBOutlet weak var movieRating: CosmosView!
    @IBOutlet weak var movieName: UILabel!
    @IBOutlet weak var movieReleaseDate: UILabel!
    @IBOutlet weak var moviesDescription: UILabel!
    @IBOutlet weak var movieLanguage: UILabel!
    @IBOutlet weak var addToFavorite: UIStackView!
    @IBOutlet weak var favLabel: UILabel!
    
    let stepBag = DisposeBag()
    var delegate : AddToFavorite?
    var indexPath : IndexPath?
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpUI()
        addFavoriteMovieMethod()
    }
    
    func setUpUI(){
        moviePhoto.layer.cornerRadius = 4
        moviePhoto.addWhiteShadow()
        addToFavorite.isUserInteractionEnabled = true
    }
    
    
    
    func addFavoriteMovieMethod(){
        addToFavorite.rx
            .tapGesture()
            .when(.recognized)
            .subscribe(onNext: { _ in
                if let d = self.delegate {
                    if let i = self.indexPath {
                        d.addFavoriteMovies(indexPath: i)
                        self.changeLikeImageTintColor()
                    }
                }
            })
            .disposed(by: stepBag)
    }
    
    func changeLikeImageTintColor(){
        switch localize {
        case "ar":
        self.likeImage.tintColor = #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1)
              self.favLabel.text = "تم الاضافة 😍"
              self.favLabel.font = UIFont(name:MovieFonts.AvenirNextBold.rawValue, size: 14)
              Timer.scheduledTimer(withTimeInterval: 1, repeats: false) {[weak self] (nil) in
                  self?.likeImage.tintColor = #colorLiteral(red: 0.9772720933, green: 0.8132748604, blue: 0.0566014275, alpha: 1)
                  self?.favLabel.text = "أضافة الى المفضلة"
                  self?.favLabel.font = UIFont(name:MovieFonts.AvenirNextRegular.rawValue , size: 14)
              }
        default :
        self.likeImage.tintColor = #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1)
              self.favLabel.text = "Added 😍"
              self.favLabel.font = UIFont(name:MovieFonts.AvenirNextBold.rawValue, size: 14)
              Timer.scheduledTimer(withTimeInterval: 1, repeats: false) {[weak self] (nil) in
                  self?.likeImage.tintColor = #colorLiteral(red: 0.9772720933, green: 0.8132748604, blue: 0.0566014275, alpha: 1)
                  self?.favLabel.text = "Add to favorite"
                  self?.favLabel.font = UIFont(name:MovieFonts.AvenirNextRegular.rawValue , size: 14)
              }
        }
      
    }
    
    
    
    
    
}
