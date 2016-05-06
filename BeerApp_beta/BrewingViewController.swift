//
//  BrewingViewController.swift
//  BeerApp_beta
//
//  Created by Nabeel Keblawi on 11/1/15.
//  Copyright © 2015 Maliszewksi Enterprises, LLC. All rights reserved.
//

import UIKit

class BrewingViewController: UIViewController, UIPageViewControllerDataSource {

    private var pageViewController: UIPageViewController?
    private let brewingViewModel = BrewingViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        createPageViewController()
        setupPageControl()
    }
    
    override func viewWillAppear(animated: Bool) {
        self.navigationItem.title = "Brewing Instructions"
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor(hexString: "#3F3C2D")]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func createPageViewController() {
        let pageController = self.storyboard?.instantiateViewControllerWithIdentifier("BrewingPageController") as! UIPageViewController
        pageController.dataSource = self
        
        if brewingViewModel.getCount() > 0 {
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
    
    private func getItemController(itemIndex: Int) -> BrewingItemController? {
        if itemIndex < brewingViewModel.getCount() {
            let pageItemController = self.storyboard!.instantiateViewControllerWithIdentifier("BrewItemController") as! BrewingItemController
            let key: BrewSteps = brewingViewModel.getKey(itemIndex)
            pageItemController.itemIndex = itemIndex
            pageItemController.brewingStepName = key.rawValue
            pageItemController.brewInstructions = brewingViewModel.getDescriptionValueFromKey(key)
            return pageItemController
        }
        return nil
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        let itemController = viewController as! BrewingItemController
        if itemController.itemIndex > 0 {
            return getItemController(itemController.itemIndex - 1)
        }
        return nil
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        let itemController = viewController as! BrewingItemController
        if itemController.itemIndex + 1 < brewingViewModel.getCount() {
            return getItemController(itemController.itemIndex + 1)
        }
        return nil
    }
    
    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int {
        return brewingViewModel.getCount()
    }
    
    func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int {
        return 0
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
