//
//  ParentCartVC.swift
//  BuddyFurniture
//
//  Created by Ayisha on 06/07/18.
//  Copyright © 2018 Furniture. All rights reserved.
//

import UIKit
import RealmSwift

class ParentCartVC: UIViewController {
    @IBOutlet weak var placeOrderLabel: UILabel!
    @IBOutlet weak var totalAmountLabel: UILabel!
    @IBOutlet weak var placeOrderButton: UIButton!
    
    var totalValue:Double = 0.0
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "CART"
        placeOrderButton.layer.cornerRadius = 25
        placeOrderButton.layer.masksToBounds = true
        var cartItems: [Product] = (self.childViewControllers.first as? ShoppingCartTVC)?.cartItems ?? []
        let realm = try! Realm()
        cartItems = Array(realm.objects(Product.self))
        let amount = cartItems.reduce(0) { ($0 + ($1.productRate * $1.quantity)) }
        totalAmountLabel.text = "\(amount)"
    }

    @IBAction func didTapPlaceOrderButton(_ sender: UIButton) {
        let orderVC = StoryboardManager.shared.shoppingCartStoryboard().instantiateViewController(withIdentifier: "OrderPlacedVCID")
        navigationController?.pushViewController(orderVC, animated: true)

        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
