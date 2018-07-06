//
//  ThemeManager.swift
//  BuddyFurniture
//
//  Created by Ayisha on 06/07/18.
//  Copyright © 2018 Furniture. All rights reserved.
//

import UIKit

/// This class will craete a theme manager to customize appearance.
final class ThemeManager {
    
    /// Singleton Instance
    static let shared: ThemeManager = ThemeManager()
    
    /// Access to initializer restricted.
    private init() {
        
    }
    
    /// customization for NavigationBar and TextField appearence
    func customizeAppearance() {
        UINavigationBar.appearance().backgroundColor = UIColor(named: "BrownThemeColor")!
        UINavigationBar.appearance().barTintColor = UIColor(named: "BrownThemeColor")!
        UIBarButtonItem.appearance().setBackButtonTitlePositionAdjustment(UIOffset(horizontal: -60,
                                                                                   vertical: 0),
                                                                          for: UIBarMetrics.default)
        let barButtonItemAppearance = UIBarButtonItem.appearance()
        barButtonItemAppearance.setTitleTextAttributes([NSAttributedStringKey.foregroundColor: UIColor.clear],
                                                       for: .normal)
        barButtonItemAppearance.setTitleTextAttributes([NSAttributedStringKey.foregroundColor: UIColor.clear],
                                                       for: .highlighted)
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.white,
                                                            .font: UIFont.latoFont(.bold, size: 18)!]
        UITextField.appearance().keyboardAppearance = .dark
    }
}

