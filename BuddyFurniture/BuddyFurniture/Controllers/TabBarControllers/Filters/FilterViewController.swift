//
//  FilterViewController.swift
//  BuddyFurniture
//
//  Created by Ayisha on 05/07/18.
//  Copyright © 2018 Furniture. All rights reserved.
//

import UIKit

protocol FilterDelegate {
    func didSelect(category: Category?, price: Int?)
}

class FilterViewController: UIViewController {

    @IBOutlet weak var rootContainerView: UIView!
    
    var contentViewController: UIViewController?
    
    var selectedCategory: Category?
    var selectedPrice: Int?

    var delegate: FilterDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "FILTER"
        showCategory()
    }
    
    @IBAction func btnCategoryPressed(_ sender: UIButton) {
        guard let contentViewController = contentViewController else {
            showCategory()
            return
        }
        if !contentViewController.isKind(of: CategoryCollectionViewController.classForCoder()) {
            showCategory()
        }
    }
    
    @IBAction func btnPricePressed(_ sender: UIButton) {
        guard let contentViewController = contentViewController else {
            showPrice()
            return
        }
        if !contentViewController.isKind(of: FilterPriceTableViewController.classForCoder()) {
            showPrice()
        }
    }
    
    
    @IBAction func btnCancelPressed(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func btnApplyPressed(_ sender: UIButton) {
        delegate?.didSelect(category: selectedCategory, price: selectedPrice)
        self.navigationController?.popViewController(animated: true)
    }
    
    func showCategory() {
        
        guard let catVC = StoryboardManager.shared.categoryStoryboard().instantiateViewController(withIdentifier: "CategoryCVCID") as? CategoryCollectionViewController else { return }
        catVC.delegate = self
        updateContentViewController(newContentViewController: catVC)
    }
    
    func showPrice() {
        
        guard let priceVC = StoryboardManager.shared.categoryStoryboard().instantiateViewController(withIdentifier: "PriceVCID") as? FilterPriceTableViewController else { return }
        priceVC.delegate = self
        updateContentViewController(newContentViewController: priceVC)
    }
    
    func updateContentViewController(newContentViewController:UIViewController, animated:Bool = true) {
        if animated == true {
            addChildViewController(newContentViewController)
            newContentViewController.view.alpha = 0
            newContentViewController.view.frame = rootContainerView.bounds
            rootContainerView.addSubview(newContentViewController.view)
            contentViewController?.willMove(toParentViewController: nil)
            
            UIView.animate(withDuration: 0.3, animations: {
                newContentViewController.view.alpha = 1
            }, completion: { (_) in
                newContentViewController.didMove(toParentViewController: self)
                
                self.contentViewController?.view.removeFromSuperview()
                self.contentViewController?.didMove(toParentViewController: nil)
                self.contentViewController?.removeFromParentViewController()
                self.contentViewController = newContentViewController
            })
        } else {
            cleanUpChildControllerIfPossible()
            
            newContentViewController.view.frame = rootContainerView.bounds
            addChildViewController(newContentViewController)
            rootContainerView.addSubview(newContentViewController.view)
            newContentViewController.didMove(toParentViewController: self)
            self.contentViewController = newContentViewController
        }
    }
    
    // MARK: - Private
    
    private func cleanUpChildControllerIfPossible() {
        if let childController = contentViewController {
            childController.willMove(toParentViewController: nil)
            childController.view.removeFromSuperview()
            childController.removeFromParentViewController()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension FilterViewController: CategorySelection {
    
    func didSelect(category: Category) {
        selectedCategory = category
    }
}

extension FilterViewController: SelectedPriceDelegate {
    
    func didSelect(price: Int) {
        selectedPrice = price
    }
}
