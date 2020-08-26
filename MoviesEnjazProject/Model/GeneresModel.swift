//
//  GeneresModel.swift
//  MoviesEnjazProject
//
//  Created by Ahmed Ayad on 8/26/20.
//  Copyright © 2020 ahmed ayad. All rights reserved.
//

import Foundation
// MARK: - Generes
struct Generes: Codable {
    let genres: [Genre]?
}

// MARK: - Genre
struct Genre: Codable {
    let id: Int?
    let name: String?
}
