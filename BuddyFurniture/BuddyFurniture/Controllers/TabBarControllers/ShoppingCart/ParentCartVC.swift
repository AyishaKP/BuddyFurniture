//
//  ParentCartVC.swift
//  BuddyFurniture
//
//  Created by Ayisha on 06/07/18.
//  Copyright © 2018 Furniture. All rights reserved.
//

import UIKit

class ParentCartVC: UIViewController {
    @IBOutlet weak var placeOrderLabel: UILabel!
    @IBOutlet weak var totalAmountLabel: UILabel!
    @IBOutlet weak var placeOrderButton: UIButton!
    
    var totalValue:Double = 0.0
    override func viewDidLoad() {
        super.viewDidLoad()
        placeOrderButton.layer.cornerRadius = 25
        placeOrderButton.layer.masksToBounds = true
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
