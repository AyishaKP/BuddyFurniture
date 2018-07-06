//
//  Product.swift
//  BuddyFurniture
//
//  Created by Ayisha on 05/07/18.
//  Copyright © 2018 Furniture. All rights reserved.
//

import Foundation
import ObjectMapper
import RealmSwift

/**
 - This mappable model is used to map the json
 with in a search result to parse the list of movies.
 - **IMPORTANT**: This model is created to map response
 that comes in application/json format from the server.
 */
class Product: Object, Mappable {
    
    /// Parameters for a movie.
    @objc dynamic var categoryId: Int = 0
    @objc dynamic var productId: Int = 0
    @objc dynamic var productName: String?
    @objc dynamic var productRate: Int = 0
    @objc dynamic var productDescription: String?
    @objc dynamic var productImage: String?
    @objc dynamic var quantity: Int = 0
    @objc dynamic var brandName: String?
    
    /// Parameters for a movie.
    required convenience init?(map: Map) {
        self.init()
    }
    
    /**
     - This function is where all variable mappings should occur
     for a json with info regarding a movie record.
     - It is executed by Mapper during the mapping (serialization and deserialization) process.
     */
    func mapping(map: Map) {
        categoryId <- map["category_id"]
        productId <- map["product_id"]
        productName <- map["product_name"]
        productRate <- map["productRate"]
        productDescription <- map["product_description"]
        productImage <- map["productImage"]
        quantity <- map["quantity"]
        brandName <- map["brandName"]
    }
    
    /// Used primary key to make the movie unique.
    override static func primaryKey() -> String? {
        return "productId"
    }
}

