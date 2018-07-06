//
//  CategoryCVC+ Extensions.swift
//  BuddyFurniture
//
//  Created by Ayisha on 04/07/18.
//  Copyright © 2018 Furniture. All rights reserved.
//

import Foundation
import UIKit

extension CategoryCollectionViewController {
    // MARK: UICollectionViewDataSource
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath)
        -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategorieCell",
                                                          for: indexPath) as? CategoryCollectionViewCell
            
            let getCategories = categories[indexPath.row]
            cell?.categoryName.text = getCategories.categoryName
          //  let url = URL(string: getCategories.categoryImage ?? "ic_poster_placeholder")
            let productImage = getCategories.categoryImage
            cell?.categoryImage.image = UIImage(named: productImage)
            cell?.categoryImage.layer.cornerRadius = 10
            cell?.categoryImage.layer.masksToBounds = true
            return cell!
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let selectedCategory = categories[indexPath.item]
        if let delegate = delegate {
            delegate.didSelect(category: selectedCategory)
            
            for indexP in collectionView.indexPathsForSelectedItems! {
                let cell = collectionView.cellForItem(at: indexP)
                cell?.backgroundColor = UIColor.clear
            }
            let cell = collectionView.cellForItem(at: indexPath)
            cell?.backgroundColor = UIColor.lightGray
            return
        }
        //guard let productVC = StoryboardManager.shared.productStoryboard().instantiateViewController(withIdentifier: "productCollectionID") as? ProductCollectionViewController else { return }
        guard let productVC = StoryboardManager.shared.productStoryboard().instantiateViewController(withIdentifier: "ParentProductVCID") as? ParentProductVC else { return }
        productVC.selectedCategory = selectedCategory
        
        navigationController?.pushViewController(productVC, animated: true)
    }
    
    override func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        if let _ = delegate {
            let cell = collectionView.cellForItem(at: indexPath)
            cell?.backgroundColor = UIColor.clear
            return
        }
    }
}
