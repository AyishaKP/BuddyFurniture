//
//  UIColor+Extensions.swift
//  BuddyFurniture
//
//  Created by Ayisha on 04/07/18.
//  Copyright © 2018 Furniture. All rights reserved.
//

import UIKit

/// This extension consist of useful variables and methods that can generate custom colors
extension UIColor {
    
    /// Background Color
    static let blackColor = UIColor(red: 17, green: 17, blue: 21)
    
    /// NavigationBar Color
    static let navigationGreyColor = UIColor(red: 24, green: 26, blue: 30)
    
    /// Highlights yellow Color
    static let yellowColor = UIColor(red: 246, green: 200, blue: 58)
    
    /// Lighter Grey Color
    static let lighterGreyColor = UIColor(red: 38, green: 40, blue: 46)
    
    /// Description Text Grey Color
    static let desciptionTextGreyColor = UIColor(red: 159, green: 159, blue: 159)
    
    /// Helper Text Grey Color
    static let helperTextGreyColor = UIColor(red: 89, green: 89, blue: 89)
    
    /// Separator Line Color
    static let seperatorLineColor = UIColor(red: 54, green: 54, blue: 59)
    
    /// Use to create a black color with transparency
    static let transparentBlack = UIColor(hex: 0x000000, alpha: 0.5)
    
    /// Used to provide border of a movie cell
    static let swanWhite = UIColor(red: 247, green: 241, blue: 227)
    
    /// Create a UIColor from RGB
    convenience init(red: Int, green: Int, blue: Int, alpha: CGFloat = 1.0) {
        self.init(
            red: CGFloat(red) / 255.0,
            green: CGFloat(green) / 255.0,
            blue: CGFloat(blue) / 255.0,
            alpha: alpha
        )
    }
    
    /// Create a UIColor from a hex value (E.g 0x000000)
    convenience init(hex: Int, alpha: CGFloat = 1.0) {
        self.init(
            red: (hex >> 16) & 0xFF,
            green: (hex >> 8) & 0xFF,
            blue: hex & 0xFF,
            alpha: alpha
        )
    }
}

