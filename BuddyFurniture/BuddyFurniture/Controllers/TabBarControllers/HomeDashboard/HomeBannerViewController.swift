//
//  HomeBannerViewController.swift
//  BuddyFurniture
//
//  Created by Ayisha on 04/07/18.
//  Copyright © 2018 Furniture. All rights reserved.
//

import UIKit

class HomeBannerViewController: UIViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {

    @IBOutlet weak var pageControl: UIPageControl!
    var pageViewController : UIPageViewController!
    var currentIndex: Int?
    
    var timer : Timer?
    private var pendingIndex: Int?
    let pageImages = [UIImage(named: "bedroomMirror"), UIImage(named: "diwan"), UIImage(named: "sofa"), UIImage(named: "tvSet")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pageViewController = self.childViewControllers[0] as! UIPageViewController
        pageViewController?.dataSource = self
        pageViewController?.delegate = self
        
        timer = Timer.scheduledTimer(timeInterval: 3, target:self, selector: #selector(HomeBannerViewController.advancePage), userInfo: nil, repeats: true)
        let startingViewController: ContentHomeOnboardVC = viewControllerAtIndex(0)
        let viewControllers = [startingViewController]
        pageViewController!.setViewControllers(viewControllers , direction: .forward, animated: false, completion: nil)
        
        setPageControl()
    }
    func setPageControl() {
        
        let pageControl = UIPageControl.appearance()
        pageControl.currentPageIndicatorTintColor = UIColor.white
        pageControl.pageIndicatorTintColor = UIColor.gray
        pageControl.backgroundColor = UIColor.clear
    }
    
    @objc func advancePage () {
        let pvcs = pageViewController?.viewControllers as! [ContentHomeOnboardVC]
        var itemIndex = pvcs[0].pageIndex
        if itemIndex! == pageImages.count-1 {
            // Rollback
            itemIndex = -1
        }
        pageControl.currentPage = itemIndex! + 1
        let firstController = viewControllerAtIndex(itemIndex!+1)
        let startingViewControllers = [firstController]
        pageViewController!.setViewControllers(startingViewControllers, direction: UIPageViewControllerNavigationDirection.forward, animated: true, completion: nil)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        let contentController = viewController as? ContentHomeOnboardVC
        let index : Int = contentController?.pageIndex ?? NSNotFound
        
        pageControl.currentPage = index
        
        let previousIndex = abs((index - 1) % (pageImages.count))
        
        let beforeContent = viewControllerAtIndex(previousIndex)
        
        return beforeContent
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        let contentController = viewController as? ContentHomeOnboardVC
        let index : Int = contentController?.pageIndex ?? NSNotFound
        
        pageControl.currentPage = index
        
        let nextIndex = abs((index + 1) % pageImages.count)
        
        let afterContent = viewControllerAtIndex(nextIndex)
        
        return afterContent
    }
    
    func viewControllerAtIndex(_ index: Int) -> ContentHomeOnboardVC {
        
        if (pageImages.count == 0 || index >= pageImages.count) {
            return ContentHomeOnboardVC()
        }
        
        let contentVC = self.storyboard?.instantiateViewController(withIdentifier: "contentVCID") as? ContentHomeOnboardVC
        contentVC?.pageIndex = index
        contentVC?.imageName = pageImages[index]
        return contentVC!
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, willTransitionTo pendingViewControllers: [UIViewController]) {
        if let itemController = pendingViewControllers[0] as? ContentHomeOnboardVC {
            self.pageControl.currentPage = itemController.pageIndex
        }
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        if !completed {
            let pageContentView = previousViewControllers[0] as! ContentHomeOnboardVC;
            self.pageControl.currentPage = pageContentView.pageIndex
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
