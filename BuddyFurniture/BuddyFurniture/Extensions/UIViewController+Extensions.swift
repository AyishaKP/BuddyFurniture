//
//  UIViewController+Extensions.swift
//  BuddyFurniture
//
//  Created by Ayisha on 04/07/18.
//  Copyright © 2018 Furniture. All rights reserved.
//

import UIKit

/**
 This extension consist of useful methods that can be used
 to show alerts in a UIViewController.
 */
extension UIViewController {
    
    /// Show alert using an localised error messege
    func show(with error: Error, okAction handler: ((UIAlertAction) -> Void)? = nil) {
        showAlert(message: (error as CustomStringConvertible).description,
                  title: "Error", okAction: handler)
    }
    
    /// Created alert controller for showing alerts
    func showAlert(message: String?, title: String = "", okAction handler: ((UIAlertAction) -> Void)? = nil) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        if let okHandler = handler {
            let okAction = UIAlertAction(title: "OK", style: .default, handler: okHandler)
            alertController.addAction(okAction)
        } else {
            let okAction = UIAlertAction(title: "OK", style: .cancel)
            alertController.addAction(okAction)
        }
        alertController.view.tintColor = UIColor.black
        self.present(alertController, animated: true, completion: nil)
    }
}

