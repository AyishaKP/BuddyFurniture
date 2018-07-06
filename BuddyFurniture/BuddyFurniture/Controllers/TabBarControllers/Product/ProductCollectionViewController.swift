//
//  ProductCollectionViewController.swift
//  BuddyFurniture
//
//  Created by Ayisha on 05/07/18.
//  Copyright © 2018 Furniture. All rights reserved.
//

import UIKit

private let reuseIdentifier = "productCellID"

class ProductCollectionViewController: UICollectionViewController {

    var products: [Product] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        sendRequest()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? ProductListingCVCell
    
        let productList = products[indexPath.row]
        
        cell?.productTitleLabel.text = productList.productName
        cell?.productImageView.layer.cornerRadius = 10
        cell?.productImageView.layer.masksToBounds = true
        return cell!
    }
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if let detailVC = StoryboardManager.shared.productStoryboard().instantiateViewController(withIdentifier: "ProductDetailVC") as? ProductDetailVC {
            let productList = products[indexPath.row]
            detailVC.product = productList
            navigationController?.pushViewController(detailVC, animated: true)
        }
    }
}

