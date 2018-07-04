//
//  CategoryCollectionViewController.swift
//  BuddyFurniture
//
//  Created by Ayisha on 04/07/18.
//  Copyright © 2018 Furniture. All rights reserved.
//

import UIKit

private let reuseIdentifier = "CategorieCell"

class CategoryCollectionViewController: UICollectionViewController {

    var categories: [Category] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Categories"
        navigationController?.navigationBar.isTranslucent = false
        sendRequest()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
