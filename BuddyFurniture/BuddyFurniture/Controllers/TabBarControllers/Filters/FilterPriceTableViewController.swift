//
//  FilterPriceTableViewController.swift
//  BuddyFurniture
//
//  Created by Ayisha on 05/07/18.
//  Copyright © 2018 Furniture. All rights reserved.
//

import UIKit

protocol SelectedPriceDelegate {
    func didSelect(price: Int)
}

class FilterPriceTableViewController: UITableViewController {

    var delegate: SelectedPriceDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.didSelect(price: indexPath.row)
        
        for indexP in tableView.indexPathsForSelectedRows! {
            let cell = tableView.cellForRow(at: indexP)
            cell?.backgroundColor = UIColor.clear
        }
        let cell = tableView.cellForRow(at: indexPath)
        cell?.backgroundColor = UIColor.lightGray
    }
    
    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        cell?.backgroundColor = UIColor.clear
    }
}
