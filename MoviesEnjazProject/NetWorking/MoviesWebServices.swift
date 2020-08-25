//
//  MoviesWebServices.swift
//  MoviesEnjazProject
//
//  Created by Ahmed Ayad on 8/25/20.
//  Copyright © 2020 ahmed ayad. All rights reserved.
//

import Foundation
import UIKit

class MoviesApiRequest {
    static let request = MoviesApiRequest()
    func getMovies(viewController:UIViewController,completionHandler : @escaping (_ movie:[Result]?)->()){
        guard let url = URL(string: "https://api.themoviedb.org/3/discover/movie?api_key=c15055372aa36c901941dfb88fd403ae&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=false&page=1") else {return}
        httpRequest(vc: viewController, url: url, httpMethod: .get, parameters: nil, headers: nil) { (rest:Swift.Result<Movies,Error>?) in
            if let movieData = rest {
                switch movieData {
                case.success(let done):
                    if let data = done.results {
                        completionHandler(data)
                    }
                case.failure(let error):
                    viewController.alert(title: "Error", messsage: error.localizedDescription)
                }
            }
        }
        
    
    }
}

class SeriesApiRequest {
    static let request = SeriesApiRequest()
    func getSeries(viewController:UIViewController,completionHandler : @escaping (_ movie:[SeriesResult]?)->()){
        guard let url = URL(string: "https://api.themoviedb.org/3/discover/tv?api_key=c15055372aa36c901941dfb88fd403ae&language=en-US&sort_by=popularity.desc&page=1&timezone=America%2FNew_York&include_null_first_air_dates=fals") else {return}
        httpRequest(vc: viewController, url: url, httpMethod: .get, parameters: nil, headers: nil) { (rest:Swift.Result<Series,Error>?) in
            if let movieData = rest {
                switch movieData {
                case.success(let done):
                    if let data = done.results {
                        completionHandler(data)
                    }
                case.failure(let error):
                    viewController.alert(title: "Error", messsage: error.localizedDescription)
                }
            }
        }
        
    
    }
}


