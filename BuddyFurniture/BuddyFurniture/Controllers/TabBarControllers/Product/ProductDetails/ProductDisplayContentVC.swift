//
//  ProductDisplayContentVC.swift
//  BuddyFurniture
//
//  Created by Ayisha on 05/07/18.
//  Copyright © 2018 Furniture. All rights reserved.
//

import UIKit
import JTSImageViewController

class ProductDisplayContentVC: UIViewController {
    @IBOutlet weak var displayImageView: UIImageView!
    var pageIndex : Int = 0
    var productImageName: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        displayImageView.image = UIImage(named: productImageName ?? "diwan")

    }
    @IBAction func didTapImage(_ sender: UIButton) {
        let imageInfo = JTSImageInfo()
        imageInfo.image = displayImageView.image
        let imageController = JTSImageViewController(imageInfo: imageInfo, mode: JTSImageViewControllerMode.image, backgroundStyle: JTSImageViewControllerBackgroundOptions.blurred)
        imageController?.show(from: self, transition: .fromOriginalPosition)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
