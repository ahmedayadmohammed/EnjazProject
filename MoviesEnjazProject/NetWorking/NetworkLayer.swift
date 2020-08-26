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
    
    AF.request(url, method: httpMethod, parameters: parameters,encoding: URLEncoding.default, headers:headers).validate().responseJSON() { (response) in
        print(response)
        switch response.response?.statusCode {
        case 200:
            if let data = response.data {
                let decoder = JSONDecoder()
                do {
                    let output = try decoder.decode(T.self, from: data)
                    completion(.success(output))
                } catch let JsonError{
                    completion(.failure(JsonError))
                }
            }

        case 401:
            if let data = response.data {
                let decoder = JSONDecoder()
                do {
                    _ = try decoder.decode(ErrorResponse.self, from: data)
             
                } catch let JsonError{
                    completion(.failure(JsonError))

                }
            }

        case 400:
            if let data = response.data {
                let decoder = JSONDecoder()

                do {
                    let output = try decoder.decode(ErrorResponse.self, from: data)

                } catch let JsonError{
                    completion(.failure(JsonError))
                }
            }

        default:
            if let data = response.data {
                let decoder = JSONDecoder()

                do {
                    _ = try decoder.decode(ErrorResponse.self, from: data)

                } catch let JsonError{
                    completion(.failure(JsonError))
                }
            }
        }
    }
}

