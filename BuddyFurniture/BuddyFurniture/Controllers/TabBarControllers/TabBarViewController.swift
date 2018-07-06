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

        let dashboardVC = StoryboardManager.shared.homeTabBar().instantiateViewController(withIdentifier: "HomeDashboardCVCID")
        let dashboardNavVC = UINavigationController(rootViewController: dashboardVC)
        let dashboardIcon = UITabBarItem(title: "Home", image: UIImage(named: "ic_home_inactive"), selectedImage: UIImage(named: "ic_home_active"))
        dashboardVC.tabBarItem = dashboardIcon
        let firstControllers = dashboardNavVC
        let homeVC = StoryboardManager.shared.productStoryboard().instantiateViewController(withIdentifier: "ParentProductVCID")
        let homeNavVC = UINavigationController(rootViewController: homeVC)
        let homeIcon = UITabBarItem(title: "Product", image: UIImage(named: "ic_home_inactive"), selectedImage: UIImage(named: "ic_home_active"))
        homeVC.tabBarItem = homeIcon
        let secondControllers = homeNavVC
        let cartVC = StoryboardManager.shared.shoppingCartStoryboard().instantiateViewController(withIdentifier: "parentCartID")
        let cartNavVC = UINavigationController(rootViewController: cartVC)
        let cartIcon = UITabBarItem(title: "Cart", image: UIImage(named: "ic_cart_inactive"), selectedImage: UIImage(named: "ic_cart_active"))
        cartVC.tabBarItem = cartIcon
        let thirdControllers = cartNavVC
        let searchVC = StoryboardManager.shared.homeTabBar().instantiateViewController(withIdentifier: "SearchVCID")
        let searchNavVC = UINavigationController(rootViewController: searchVC)
        let searchIcon = UITabBarItem(title: "Search", image: UIImage(named: "ic_searche_inactive"), selectedImage: UIImage(named: "ic_search_active"))
        searchVC.tabBarItem = searchIcon
        let fourthControllers = searchNavVC
        
        self.viewControllers = [firstControllers,secondControllers,thirdControllers,fourthControllers]
        
        tabBar.barTintColor =  UIColor(named: "BrownThemeColor")!
        tabBar.tintColor = UIColor.white
        //tabBar.selectedItem?.badgeColor = UIColor.appPurple()
        let numberOfItems = CGFloat(tabBar.items!.count)
        let tabBarItemSize = CGSize(width: tabBar.frame.width / numberOfItems, height: tabBar.frame.height)
        tabBar.selectionIndicatorImage = UIImage.imageWithColor(color: UIColor.transparentBlack, size: tabBarItemSize).resizableImage(withCapInsets:.zero)
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
