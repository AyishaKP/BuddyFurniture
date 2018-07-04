//
//  Category+Handler.swift
//  BuddyFurniture
//
//  Created by Ayisha on 05/07/18.
//  Copyright © 2018 Furniture. All rights reserved.
//

import Foundation
import ObjectMapper

/**
 - This mappable model is used to map the response
 that comes after passing the parameters.
 
 - IMPORTANT: This model is created to map response
 that comes in application/json format from the server.
 */
class CategoryHandler: Mappable {
    
    var message: String?
    var status: Bool = false
    var furnitureCategories: [Category]?
    
    /**
     - This function can be used to validate JSON prior to mapping.
     */
    required init?(map: Map) {
        
    }
    
    /**
     - This function is where all variable mappings should occur
     for a json received for a search api response.
     - It is executed by Mapper during the mapping (serialization and deserialization) process.
     */
    func mapping(map: Map) {
        message <- map["message"]
        status <- map["status"]
        furnitureCategories <- map["product_categories"]
    }
}

