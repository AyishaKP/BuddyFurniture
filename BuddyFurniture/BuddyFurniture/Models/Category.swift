//
//  Category.swift
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
 with category result to parse the list of categories.
 
 - **IMPORTANT**: This model is created to map response
 that comes in application/json format from the server.
 */
class Category: Object, Mappable {
    
    /// Parameters for a category.
    @objc dynamic var categoryId: Int = 0
    @objc dynamic var categoryName: String = ""
    @objc dynamic var categoryImage: String = ""
    
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
        categoryName <- map["category_name"]
        categoryImage <- map["category_image"]
    }
}

