//
//  TabBarViewController.swift
//  BuddyFurniture
//
//  Created by Ayisha on 04/07/18.
//  Copyright © 2018 Furniture. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let homeVC = StoryboardManager.shared.categoryStoryboard().instantiateViewController(withIdentifier: "CategoryCVCID") as? CategoryCollectionViewController
        let homeNavVC = UINavigationController(rootViewController: homeVC!)
        let homeIcon = UITabBarItem(title: "Home", image: UIImage(named: "ic_home_inactive"), selectedImage: UIImage(named: "ic_home_active"))
        homeVC?.tabBarItem = homeIcon
        let firstControllers = homeNavVC
        
        self.viewControllers = [firstControllers,firstControllers,firstControllers,firstControllers,firstControllers]
        
        tabBar.barTintColor = UIColor.black
        tabBar.tintColor = UIColor.white
        //tabBar.selectedItem?.badgeColor = UIColor.appPurple()
        let numberOfItems = CGFloat(tabBar.items!.count)
        let tabBarItemSize = CGSize(width: tabBar.frame.width / numberOfItems, height: tabBar.frame.height)
        tabBar.selectionIndicatorImage = UIImage.imageWithColor(color: UIColor.brown, size: tabBarItemSize).resizableImage(withCapInsets:.zero)
        // remove default border
        tabBar.frame.size.width = self.view.frame.width + 4
        tabBar.frame.origin.x = -2
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
