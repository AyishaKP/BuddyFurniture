//
//  CategoryCollectionViewController+Data.swift
//  BuddyFurniture
//
//  Created by Ayisha on 05/07/18.
//  Copyright © 2018 Furniture. All rights reserved.
//

import Foundation
import UIKit
import ObjectMapper

extension CategoryCollectionViewController {
    
    func sendRequest() {
        categories.removeAll()
        if let path = Bundle.main.path(forResource: "Categories", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
                if let jsonResult = jsonResult as? Dictionary<String, AnyObject> {
                    let handler = CategoryHandler(JSON: jsonResult)
                    guard let categoryHandler = handler?.furnitureCategories, categoryHandler.count > 0 else { return }
                    categoryHandler.forEach { categories.append($0) }
                    DispatchQueue.main.async {
                        self.collectionView?.reloadData()
                    }
                }
            } catch {
                // handle error
            }
        }
    }
}
