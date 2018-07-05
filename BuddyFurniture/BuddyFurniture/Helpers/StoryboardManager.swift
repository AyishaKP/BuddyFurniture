//
//  StoryboardManager.swift
//  BuddyFurniture
//
//  Created by Ayisha on 04/07/18.
//  Copyright © 2018 Furniture. All rights reserved.
//

import UIKit

class StoryboardManager {
    
    static let shared: StoryboardManager = StoryboardManager()
    
    func onBoarding() -> UIStoryboard {
        return UIStoryboard(name: Constants.storyboardName.onBoarding, bundle: nil)
    }
    func homeTabBar() -> UIStoryboard {
        return UIStoryboard(name: Constants.storyboardName.homeTabBar, bundle: nil)
    }
    func categoryStoryboard() -> UIStoryboard {
        return UIStoryboard(name: Constants.storyboardName.categoryStoryBoard, bundle: nil)
    }
    func productStoryboard() -> UIStoryboard {
        return UIStoryboard(name: Constants.storyboardName.productsStoryboard, bundle: nil)
    }
    func filterStoryboard() -> UIStoryboard {
        return UIStoryboard(name: Constants.storyboardName.filterStoryboard, bundle: nil)
    }
    func shoppingCartStoryboard() -> UIStoryboard {
        return UIStoryboard(name: Constants.storyboardName.shoppingCart, bundle: nil)
    }
    
    
}
