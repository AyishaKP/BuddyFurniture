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

    var products: [Product] = [] {
        didSet {
            collectionView?.reloadData()
        }
    }
    
    var selectedCategory: Category?
    var priceRange: Int?

    override func viewDidLoad() {
        super.viewDidLoad()
        filterProductsIfNeeded()
        
        collectionView?.reloadData()
        title = "PRODUCTS"
    }

    func filterProductsIfNeeded() {
        sendRequest()

        if let selectedCategory = selectedCategory {
            products = products.filter { $0.categoryId == selectedCategory.categoryId }
        }
        
        if let priceRange = priceRange {
            var maxPrice: Int?
            switch priceRange {
            case 0:
                // 1 - 1000
                maxPrice = 1000
            case 1:
                // 1001 - 10000
                maxPrice = 10000
            case 2:
                // Above 10000
                maxPrice = 10001
            default: break
            }
            if let maxPrice = maxPrice {
                if maxPrice == 10001 {
                    products = products.filter { $0.productRate >= maxPrice }
                }else {
                    products = products.filter { $0.productRate <= maxPrice }
                }
            }
        }
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
        cell?.currentRateLabel.text = "\(productList.productRate)"
        cell?.productImageView.image = UIImage(named: productList.productImage!)
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

