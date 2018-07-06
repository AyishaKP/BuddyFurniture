//
//  ShoppingListTVCell.swift
//  BuddyFurniture
//
//  Created by Ayisha on 06/07/18.
//  Copyright © 2018 Furniture. All rights reserved.
//

import UIKit

protocol shoppingCartProtocol {
    func didTapAddButton(senderCell:ShoppingListTVCell, sender:UIButton, product: Product)
    func didTapSubtractButton(senderCell:ShoppingListTVCell, sender:UIButton, product: Product)
}
class ShoppingListTVCell: UITableViewCell {
    @IBOutlet weak var productImage: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var productRateLabel: UILabel!
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var mainView: UIView!
    var shoppingDelegate : shoppingCartProtocol?
    var product: Product? {
        didSet {
            self.productCount = product?.quantity ?? 0
            // self.productRateLabel.text = product?.price ?? ""
        }
    }
    var productCount : Int = 1
    {
        didSet
        {
            if countLabel != nil
            {
                countLabel.text = "\(productCount)"
            }
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        countLabel.layer.cornerRadius = 8
        countLabel.layer.masksToBounds = true
        countLabel.layer.borderColor = UIColor.lightGray.cgColor
        countLabel.layer.borderWidth = 1.0
        mainView.layer.borderColor = UIColor.lightGray.cgColor
        mainView.layer.borderWidth = 0.5
        
    }
    @IBAction func addButtonPressed(_ sender: UIButton) {
        
        self.productCount += 1
        
        if let product = product
        {
            
            self.shoppingDelegate?.didTapAddButton(senderCell: self, sender: sender, product: product)
        }
    }
    
    @IBAction func minusButtonPressed(_ sender: UIButton) {
        if productCount != 0
        {
            self.productCount -= 1
        }
        
        if let product = product
        {
            shoppingDelegate?.didTapSubtractButton(senderCell: self, sender: sender, product: product)
        }
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
