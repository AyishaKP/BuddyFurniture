//
//  ParentProductVC.swift
//  BuddyFurniture
//
//  Created by Ayisha on 06/07/18.
//  Copyright © 2018 Furniture. All rights reserved.
//

import UIKit
import FTPopOverMenu_Swift

class ParentProductVC: UIViewController {
    
    @IBOutlet weak var sortButton: UIButton!
    @IBOutlet weak var containerView: UIView!
    
    var selectedCategory: Category?
    var priceRange: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "PRODUCTS"
        (self.childViewControllers.first as? ProductCollectionViewController)?.selectedCategory = selectedCategory
        
        (self.childViewControllers.first as? ProductCollectionViewController)?.filterProductsIfNeeded()
    }

    @IBAction func didTapSort(_ sender: UIButton) {

        FTPopOverMenu.showForSender(sender: sender,
                                    with: ["Low to High", "High to Low"],
                                    done: { (selectedIndex) -> () in
                                        var products: [Product] = (self.childViewControllers.first as? ProductCollectionViewController)?.products ?? []
                                                switch selectedIndex {
                                                case 0:
                                                    products.sort(by: { $0.productRate < $1.productRate })
                                                case 1:
                                                    products.sort(by: { $0.productRate > $1.productRate })
                                                default:
                                                    break
                                                }
                                        
                                        (self.childViewControllers.first as? ProductCollectionViewController)?.products = products
                                        
        }) {
            
        }
    }
  
    
    @IBAction func didTapFilter(_ sender: UIButton) {
        let filterVC = StoryboardManager.shared.categoryStoryboard().instantiateInitialViewController() as? FilterViewController
        filterVC?.delegate = self
        navigationController?.pushViewController(filterVC!, animated: true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension ParentProductVC: FilterDelegate {
    
    func didSelect(category: Category?, price: Int?) {
        
        selectedCategory = category
        (self.childViewControllers.first as? ProductCollectionViewController)?.selectedCategory = selectedCategory
        (self.childViewControllers.first as? ProductCollectionViewController)?.priceRange = price
        (self.childViewControllers.first as? ProductCollectionViewController)?.filterProductsIfNeeded()
    }
}

