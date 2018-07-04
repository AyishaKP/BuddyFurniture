//
//  ContentOnboardVC.swift
//  BuddyFurniture
//
//  Created by Ayisha on 04/07/18.
//  Copyright © 2018 Furniture. All rights reserved.
//

import UIKit

class ContentOnboardVC: UIViewController {

    @IBOutlet weak var displayImages: UIImageView!
    var imageName : UIImage?
    var pageIndex : Int!
    override func viewDidLoad() {
        super.viewDidLoad()
        displayImages.image = imageName

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
