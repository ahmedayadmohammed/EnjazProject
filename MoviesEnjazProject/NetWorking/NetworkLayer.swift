//
//  NetworkLayer.swift
//  MoviesEnjazProject
//
//  Created by Ahmed Ayad on 8/25/20.
//  Copyright © 2020 ahmed ayad. All rights reserved.
//

import Foundation
import Alamofire
import NVActivityIndicatorView
func httpRequest<T: Codable >(vc:UIViewController, url:URL, httpMethod:HTTPMethod, parameters: Parameters?,headers:HTTPHeaders?, completion: @escaping (Swift.Result<T,Error>) -> ()) {
    
    
//    let frame = CGRect(x: 0, y: 0, width: 50, height: 50)
//    let indicatorView = NVActivityIndicatorView(frame: frame, type: .circleStrokeSpin, color: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), padding: 1)
//      indicatorView.center = vc.view.center
//      vc.view.addSubview(indicatorView)
//      indicatorView.snp.makeConstraints { (make) in
//          make.center.equalToSuperview()
//          make.width.equalTo(30)
//          make.height.equalTo(30)
//      }
//      indicatorView.startAnimating()
//
    
    AF.request(url, method: httpMethod, parameters: parameters,encoding: URLEncoding.default, headers:headers).validate().responseJSON() { (response) in
        print(response)
        switch response.response?.statusCode {
        case 200:
            if let data = response.data {
                let decoder = JSONDecoder()
                do {
                    let output = try decoder.decode(T.self, from: data)
                    completion(.success(output))
//                    indicatorView.stopAnimating()

                    
                } catch let JsonError{
                    completion(.failure(JsonError))
                }
            }

        case 401:
            if let data = response.data {
                let decoder = JSONDecoder()
                do {
                    _ = try decoder.decode(ErrorResponse.self, from: data)
//                    indicatorView.stopAnimating()

             
                } catch let JsonError{
                    completion(.failure(JsonError))
//                    indicatorView.stopAnimating()

                }
            }

        case 400:
            if let data = response.data {
                let decoder = JSONDecoder()

                do {
                    let output = try decoder.decode(ErrorResponse.self, from: data)
//                    indicatorView.stopAnimating()


                } catch let JsonError{
                    completion(.failure(JsonError))
                }
            }

        default:
            if let data = response.data {
                let decoder = JSONDecoder()

                do {
                    _ = try decoder.decode(ErrorResponse.self, from: data)
//                    indicatorView.stopAnimating()

                } catch let JsonError{
                    completion(.failure(JsonError))
                }
            }
        }
    }
}

