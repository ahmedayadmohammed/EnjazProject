//
//  MovieFavorite+CoreDataProperties.swift
//  
//
//  Created by Ahmed Ayad on 8/25/20.
//
//

import Foundation
import CoreData


extension MovieFavorite {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<MovieFavorite> {
        return NSFetchRequest<MovieFavorite>(entityName: "MovieFavorite")
    }

    @NSManaged public var title: String?
    @NSManaged public var raring: Double
    @NSManaged public var overview: String?
    @NSManaged public var releasedate: String?
    @NSManaged public var photo: String?
    @NSManaged public var id: Int16
    @NSManaged public var language: String?

}
