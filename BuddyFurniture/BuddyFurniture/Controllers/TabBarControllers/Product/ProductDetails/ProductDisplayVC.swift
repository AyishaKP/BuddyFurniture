//
//  ProductDisplayVC.swift
//  BuddyFurniture
//
//  Created by Ayisha on 05/07/18.
//  Copyright © 2018 Furniture. All rights reserved.
//

import UIKit

class ProductDisplayVC: UIViewController {
    @IBOutlet var pageControl: UIPageControl!
    
    var pageViewController : UIPageViewController!
    var currentIndex: Int?
    private var timer : Timer?
    private var pendingIndex: Int?
    var pageImages : [String] = []
    var product: Products? {
        didSet {
            customize()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        pageViewController = self.childViewControllers[0] as! UIPageViewController
        pageViewController?.dataSource = self
        pageViewController?.delegate = self
        
        setPageControl()
        let firstController = viewControllerAtIndex(0)
        let startingViewControllers = [firstController]
        pageViewController.setViewControllers(startingViewControllers as? [ProductDisplayContentVC], direction: UIPageViewControllerNavigationDirection.forward, animated: true, completion: nil)
    }
    func customize() {
        guard let product = product else { return }
        let productImage = product.productImage
        pageImages.append(productImage!)
        pageImages.append(productImage!)
        pageImages.append(productImage!)
    
        DispatchQueue.main.async { [weak self] in
            guard let weakSelf = self else { return }
            let firstController = weakSelf.viewControllerAtIndex(0)
            let startingViewControllers = [firstController]
            weakSelf.pageViewController.setViewControllers(startingViewControllers as? [ProductDisplayContentVC], direction: UIPageViewControllerNavigationDirection.forward, animated: true, completion: nil)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
    extension ProductDisplayVC: UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    
    func setPageControl() {
        
        let pageControl = UIPageControl.appearance()
        pageControl.currentPageIndicatorTintColor = UIColor.white
        pageControl.pageIndicatorTintColor = UIColor.gray
        pageControl.backgroundColor = UIColor.clear
    }
    
    func advancePage () {
        guard let pageViewController = pageViewController else { return }
        let pvcs = pageViewController.viewControllers as! [ProductDisplayContentVC]
        var itemIndex = pvcs[0].pageIndex
        if itemIndex == pageImages.count-1 {
            // Rollback
            itemIndex = -1
        }
        if (pageImages.count == 0 || itemIndex + 1 >= pageImages.count) {
            return
        }
        pageControl.currentPage = itemIndex + 1
        let firstController = viewControllerAtIndex(itemIndex+1)
        let startingViewControllers = [firstController]
        pageViewController.setViewControllers(startingViewControllers as? [ProductDisplayContentVC], direction: UIPageViewControllerNavigationDirection.forward, animated: true, completion: nil)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        let contentController = viewController as? ProductDisplayContentVC
        let index : Int = contentController?.pageIndex ?? NSNotFound
        
        pageControl.currentPage = index
        let previousIndex = abs((index - 1) % (pageImages.count))
        let beforeContent = viewControllerAtIndex(previousIndex)
        return beforeContent
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        let contentController = viewController as? ProductDisplayContentVC
        let index : Int = contentController?.pageIndex ?? NSNotFound
        
        pageControl.currentPage = index
        let nextIndex = abs((index + 1) % (pageImages.count))
        let afterContent = viewControllerAtIndex(nextIndex)
        return afterContent
    }
    
    func viewControllerAtIndex(_ index: Int) -> ProductDisplayContentVC? {
        let contentVC = StoryboardManager.shared.productStoryboard().instantiateViewController(withIdentifier: "ProductDisplayContentVC") as? ProductDisplayContentVC
        contentVC?.pageIndex = index
        if (pageImages.count == 0 || index >= pageImages.count) {
            return contentVC
        }
        contentVC?.productImageName = pageImages[index]
        return contentVC!
}
}
