//
//  ProductCollectionViewController+Data.swift
//  BuddyFurniture
//
//  Created by Ayisha on 05/07/18.
//  Copyright © 2018 Furniture. All rights reserved.
//

import Foundation

extension ProductCollectionViewController {
    
    func sendRequest() {
        products.removeAll()
    if let path = Bundle.main.path(forResource: "Products", ofType: "json") {
        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
            let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
            if let jsonResult = jsonResult as? Dictionary<String, AnyObject> {
                let handler = ProductsHandler(JSON: jsonResult)
                guard let productHandler = handler?.products, productHandler.count > 0 else { return }
                productHandler.forEach { products.append($0) }
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
