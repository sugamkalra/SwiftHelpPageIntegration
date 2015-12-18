//
//  CaneQualityHelpPageViewController.swift
//  SwiftyHelpPageIntegration
//
//  Created by Sugam Kalra on 18/12/15.
//  Copyright © 2015 Sugam Kalra. All rights reserved.
//

import UIKit

/**
 * CaneQualityHelpPageViewController
 *
 * @author Sugam
 * @version 1.0
 */
class CaneQualityHelpPageViewController: UIViewController {
    
    /// help images, load from Config.plist
    let helpImages = Config.sharedInstance.getHelpImages()
    
    /// outlets
    @IBOutlet weak var pageControllerContentView: UIView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    /// page view controller
    var pageViewController: UIPageViewController!
    
    /**
     view did load
     
     configure page view controller
     */
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pageControl.numberOfPages = helpImages.count
        
        var startingViewControllers = [UIViewController]()
        startingViewControllers.append(self.viewControllerAtIndex(0)!)
        pageViewController = UIPageViewController(transitionStyle: .Scroll, navigationOrientation: .Horizontal, options: nil)
        pageViewController.setViewControllers(startingViewControllers, direction: .Forward, animated: false, completion: nil)
        pageViewController.view.backgroundColor = UIColor.wildSandColor()
        pageViewController.dataSource = self
        pageViewController.delegate = self
        loadChildController(pageViewController, inContentView: pageControllerContentView)
    }
    
    /**
     orientation support
     */
    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.Landscape
    }
    
    /**
     status bar style preference
     */
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }
    
    /**
     okay button action
     
     - parameter sender: the sender
     */
    @IBAction func okayButtonDidPress(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}

/**
 * MARK: UIPageViewController Data Source
 *
 * @author Sugam
 * @version 1.0
 */
extension CaneQualityHelpPageViewController: UIPageViewControllerDataSource {
    
    /**
     presentation controller number of page
     */
    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int {
        return helpImages.count
    }
    
    /**
     view controller after :viewController
     */
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        let pageIndex = (viewController as! CaneQualityHelpContentViewController).pageIndex
        if pageIndex == 0 || pageIndex == NSNotFound {
            return nil
        }
        return viewControllerAtIndex(pageIndex - 1)
    }
    
    /**
     view controller before :viewController
     */
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        let pageIndex = (viewController as! CaneQualityHelpContentViewController).pageIndex
        if pageIndex == self.helpImages.count-1 || pageIndex == NSNotFound {
            return nil
        }
        return viewControllerAtIndex(pageIndex + 1)
    }
    
    /**
     Get view controller at index :index
     
     - parameter index: the index
     */
    func viewControllerAtIndex(index: Int) -> CaneQualityHelpContentViewController? {
        if helpImages.count == 0 || index >= helpImages.count {
            return nil
        }
        
        // create content for page :index
        let contentVC = create(CaneQualityHelpContentViewController.self)!
        contentVC.image = UIImage(named: helpImages[index])!
        contentVC.pageIndex = index
        return contentVC
    }
}

/**
 * MARK: UIPageViewController Delegate
 *
 * @author Sugam
 * @version 1.0
 */
extension CaneQualityHelpPageViewController: UIPageViewControllerDelegate {
    
    /**
     did finish animating
     
     update UIPageControl current page
     */
    func pageViewController(pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        let pageIndex = (pageViewController.viewControllers![0] as! CaneQualityHelpContentViewController).pageIndex
        self.pageControl.currentPage = pageIndex
    }
}