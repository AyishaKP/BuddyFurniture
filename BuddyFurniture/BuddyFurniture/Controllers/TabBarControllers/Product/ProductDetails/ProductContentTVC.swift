//
//  ProductContentTVC.swift
//  BuddyFurniture
//
//  Created by Ayisha on 05/07/18.
//  Copyright © 2018 Furniture. All rights reserved.
//

import UIKit

enum ProductDetailChild: Int {
    case productDisplay
}
class ProductContentTVC: AccordionTableViewController {
    
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var brandName: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var discountPrice: UILabel!
    
    var arrayTitle :[String] = ["Description"]
    
    var product: Products? {
        didSet {
            DispatchQueue.main.async { [weak self] in
                guard let weakSelf = self else { return }
                weakSelf.customizeSubViews()
                weakSelf.tableView.reloadData()
            }
        }
    }

    func customizeSubViews() {
        guard let product = product else { return }
        productName.text = product.productName
        brandName.text = "Brand: \(String(describing: product.brandName!))"
        priceLabel.text = "\(product.productRating)"
        
        if let childVC = self.childViewControllers[ProductDetailChild.productDisplay.rawValue] as? ProductDisplayVC {
            childVC.product = product
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.backgroundColor = UIColor.white

    }
    func expandCollapseFirstCell() {
        if expandedIndexPaths.count == 0 {
            expandedIndexPaths.removeAll()
        }else {
            let firstCellIndexPath = IndexPath(row: 0, section: 0)
            expandedIndexPaths.append(firstCellIndexPath)
        }
        self.tableView.beginUpdates()
        self.tableView.endUpdates()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
