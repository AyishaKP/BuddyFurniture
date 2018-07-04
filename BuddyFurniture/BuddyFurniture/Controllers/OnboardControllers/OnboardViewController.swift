//
//  OnboardViewController.swift
//  BuddyFurniture
//
//  Created by Ayisha on 04/07/18.
//  Copyright © 2018 Furniture. All rights reserved.
//

import UIKit

protocol OnboardProtocol {
    
    func didOnboard()
}
class OnboardViewController: UIViewController {
    var onboardDelegate : OnboardProtocol!
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
    }

    @IBAction func didTapToStart(_ sender: Any) {
        onboardDelegate.didOnboard()
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    }
