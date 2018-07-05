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
            cell?.categoryImage.image = UIImage(named: productImage ?? "diwan")
            cell?.categoryImage.layer.cornerRadius = 10
            cell?.categoryImage.layer.masksToBounds = true
            return cell!
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //guard let productVC = StoryboardManager.shared.productStoryboard().instantiateViewController(withIdentifier: "productCollectionID") as? ProductCollectionViewController else { return }
        guard let productVC = StoryboardManager.shared.productStoryboard().instantiateViewController(withIdentifier: "ParentProductVCID") as? ParentProductVC else { return }
        
        navigationController?.pushViewController(productVC, animated: true)
    }
}
