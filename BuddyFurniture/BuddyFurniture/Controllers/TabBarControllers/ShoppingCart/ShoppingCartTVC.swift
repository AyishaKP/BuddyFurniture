//
//  ShoppingCartTVC.swift
//  BuddyFurniture
//
//  Created by Ayisha on 06/07/18.
//  Copyright © 2018 Furniture. All rights reserved.
//

import UIKit
import RealmSwift

class ShoppingCartTVC: UITableViewController {

    var cartItems: [Product] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let realm = try! Realm()
        cartItems = Array(realm.objects(Product.self))
        tableView.reloadData()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {

        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return cartItems.count
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "checkoutCell", for: indexPath) as? ShoppingListTVCell

        let product = cartItems[indexPath.row]
        
//        @IBOutlet weak var productImage: UIImageView!
//
//        @IBOutlet weak var titleArray: UILabel!
//        @IBOutlet weak var productRateLabel: UILabel!
//        @IBOutlet weak var plusButton: UIButton!
//        @IBOutlet weak var countLabel: UILabel!
//        @IBOutlet weak var minusButton: UIButton!
//        @IBOutlet weak var mainView: UIView!
        
        cell?.productImage.image = UIImage(named: product.productImage!)
        cell?.titleLabel.text = product.productName
        cell?.productRateLabel.text = "Price: \(product.productRate)"
        cell?.countLabel.text = "\(product.quantity)"
        
        return cell!
    }
}
