//
//  SeriesModel.swift
//  MoviesEnjazProject
//
//  Created by Ahmed Ayad on 8/25/20.
//  Copyright © 2020 ahmed ayad. All rights reserved.
//

import Foundation

// MARK: - Generes
struct Series: Codable {
    let page, totalResults, totalPages: Int?
    let results: [SeriesResult]?

    enum CodingKeys: String, CodingKey {
        case page
        case totalResults = "total_results"
        case totalPages = "total_pages"
        case results
    }
}

// MARK: - Result
struct SeriesResult: Codable {
    let originalName: String?
    let genreIDS: [Int]?
    let name: String?
    let popularity: Double?
    let originCountry: [String]?
    let voteCount: Int?
    let firstAirDate, backdropPath: String?
    let originalLanguage: String?
    let id: Int?
    let voteAverage: Double?
    let overview, posterPath: String?

    enum CodingKeys: String, CodingKey {
        case originalName = "original_name"
        case genreIDS = "genre_ids"
        case name, popularity
        case originCountry = "origin_country"
        case voteCount = "vote_count"
        case firstAirDate = "first_air_date"
        case backdropPath = "backdrop_path"
        case originalLanguage = "original_language"
        case id
        case voteAverage = "vote_average"
        case overview
        case posterPath = "poster_path"
    }
}

