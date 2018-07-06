//
//  CategoryCollectionViewController.swift
//  BuddyFurniture
//
//  Created by Ayisha on 04/07/18.
//  Copyright © 2018 Furniture. All rights reserved.
//

import UIKit

protocol CategorySelection {
    func didSelect(category: Category)
}

private let reuseIdentifier = "CategorieCell"

class CategoryCollectionViewController: UICollectionViewController {

    var categories: [Category] = []
    var delegate: CategorySelection?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Categories"
        navigationController?.navigationBar.isTranslucent = false
        collectionView?.allowsMultipleSelection = true
//        collectionView?.backgroundView = UIImageView(image: UIImage(named: "theme_background"))
        sendRequest()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
