//
//  ProductListingCVCell.swift
//  BuddyFurniture
//
//  Created by Ayisha on 05/07/18.
//  Copyright © 2018 Furniture. All rights reserved.
//

import UIKit

class ProductListingCVCell: UICollectionViewCell {
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var productTitleLabel: UILabel!
    @IBOutlet weak var currentRateLabel: UILabel!
    @IBOutlet weak var oldPriceLabel: UILabel!
    @IBOutlet weak var buttonHeart: UIButton!
    
   // var heartWishlistDelegate : WishlistProtocol?
    
    @IBAction func didTapHeartButton(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected

    }
}
