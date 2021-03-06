//
//  CellaringViewController.swift
//  BeerApp_beta
//
//  Created by Nabeel Keblawi on 9/25/15.
//  Copyright © 2015 Maliszewksi Enterprises, LLC. All rights reserved.
//

import UIKit

class CellaringViewController: UIViewController, UIScrollViewDelegate {

    private let cellaringViewModel = CellaringViewModel()
    private var labelDesc: UILabel = UILabel()
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var bodyView: UIView!
    @IBOutlet weak var titleView: UIView!
    @IBOutlet weak var contentView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        scrollView.delegate = self
        /*
        if let lastView = scrollView.subviews.last {
            var sizeOfContent: CGFloat = 0
            let wd: CGFloat = lastView.frame.origin.y
            let ht: CGFloat = lastView.frame.size.height
            sizeOfContent = wd + ht
            scrollView.contentSize = CGSizeMake(scrollView.frame.size.width, sizeOfContent)
        }
        */
        scrollView.contentSize = view.bounds.size
        scrollView.autoresizingMask = UIViewAutoresizing.FlexibleHeight
    }

    override func viewWillAppear(animated: Bool) {
        self.navigationItem.title = "Cellaring 101"
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor(hexString: "#3F3C2D")]
        initializeView()
    }

    
    override func viewWillDisappear(animated: Bool) {
        self.navigationItem.title = "Cellaring Controller"
        scrollView.contentOffset = CGPointMake(0, 0);
        for view in bodyView.subviews {
            view.removeFromSuperview()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidLayoutSubviews() {
        let scrollViewBounds = scrollView.bounds
        let containerViewBounds = contentView.bounds
        
        var scrollViewInsets = UIEdgeInsetsZero
        scrollViewInsets.top = scrollViewBounds.size.height / 2.0;
        scrollViewInsets.top -= containerViewBounds.size.height / 2.0;
        
        scrollViewInsets.bottom = scrollViewBounds.size.height / 2.0
        scrollViewInsets.bottom -= containerViewBounds.size.height / 2.0;
        scrollViewInsets.bottom += 1
        
        scrollView.contentInset = scrollViewInsets
    }
    
    override func didRotateFromInterfaceOrientation(fromInterfaceOrientation: UIInterfaceOrientation) {
        let subViews = self.bodyView.subviews
        for subview in subViews{
            subview.removeFromSuperview()
        }
        initializeView()
    }

    func initializeView() {
        let screenSize: CGRect = UIScreen.mainScreen().bounds
        let screenWidth: Int = Int(screenSize.width)
        
        let startX = 25
        let startY = UIDevice.isLandscape() ? 100 : 50
        let descriptionWidth = screenWidth - (startX * 2)
        
        let fontSize: CGFloat = UIDevice.currentDevice().userInterfaceIdiom == .Pad ? 16 : 12
        let descRect = CGRect(x: startX, y: startY, width: descriptionWidth, height: 800)
        labelDesc.frame = descRect
        labelDesc.text = cellaringViewModel.getCellaringTips()
        labelDesc.font = labelDesc.font.fontWithSize(fontSize)
        labelDesc.numberOfLines = 0
        labelDesc.textColor = UIColor(hexString: "#3F3C2D")
        labelDesc.sizeToFit()
        bodyView.addSubview(labelDesc)
        scrollView.contentSize.height = titleView.bounds.height + labelDesc.bounds.height + CGFloat(startY * 2)
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
