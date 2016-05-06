//
//  ViewController.swift
//  BeerApp_beta
//
//  Created by Nabeel Keblawi on 9/21/15.
//  Copyright © 2015 Maliszewksi Enterprises, LLC. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UIPageViewControllerDataSource {

    private var pageViewController: UIPageViewController?
    private let beerViewModel = BeerViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        setupTabBarController()
        createPageViewController()
        setupPageControl()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    private func setupTabBarController() {
        super.tabBarController?.customizableViewControllers = nil
        
        let moreTableView = super.tabBarController?.moreNavigationController.topViewController?.view as? UITableView
        moreTableView?.separatorStyle = .None
    }
    
    private func createPageViewController() {
        let pageController = self.storyboard!.instantiateViewControllerWithIdentifier("PageController") as! UIPageViewController
        pageController.dataSource = self
        
        if beerViewModel.getCount() > 0 {
            let firstController = getItemController(0)!
            let startingViewControllers: NSArray = [firstController]
            pageController.setViewControllers(startingViewControllers as? [UIViewController], direction: UIPageViewControllerNavigationDirection.Forward, animated: false, completion: nil)
        }
        
        pageViewController = pageController
        addChildViewController(pageViewController!)
        self.view.addSubview(pageViewController!.view)
        pageViewController!.didMoveToParentViewController(self)
    }
    
    private func setupPageControl() {
        let appearance = UIPageControl.appearance()
        appearance.pageIndicatorTintColor = UIColor.grayColor()
        appearance.currentPageIndicatorTintColor = UIColor.whiteColor()
        appearance.backgroundColor = UIColor.darkGrayColor()
    }
    
    private func getItemController(itemIndex: Int) -> PageItemController? {
        if itemIndex < beerViewModel.getCount() {
            let pageItemController = self.storyboard!.instantiateViewControllerWithIdentifier("ItemController") as! PageItemController
            pageItemController.itemIndex = itemIndex
            pageItemController.beerName = beerViewModel.getBeerName(itemIndex)
            pageItemController.displayBeerName = beerViewModel.getDisplayBeerName(itemIndex)
            pageItemController.glasses = beerViewModel.getGlasswareChoices(itemIndex)
            pageItemController.urlString = beerViewModel.getRecommendedURL(itemIndex)
            pageItemController.beerDescription = beerViewModel.getBeerDescription(itemIndex)
            return pageItemController
        }
        return nil
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        let itemController = viewController as! PageItemController
        if itemController.itemIndex > 0 {
            return getItemController(itemController.itemIndex - 1)
        }
        return nil
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        let itemController = viewController as! PageItemController
        if itemController.itemIndex + 1 < beerViewModel.getCount() {
            return getItemController(itemController.itemIndex + 1)
        }
        return nil
    }
    
    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int {
        return beerViewModel.getCount()
    }
    
    func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int {
        return 0
    }
}

