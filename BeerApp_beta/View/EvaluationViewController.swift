//
//  EvaluationViewController.swift
//  BeerApp_beta
//
//  Created by Nabeel Keblawi on 9/25/15.
//  Copyright © 2015 Nabeel Keblawi. All rights reserved.
//

import UIKit

class EvaluationViewController: UIViewController, UIScrollViewDelegate {
    
    private let evaluationViewModel = EvaluationViewModel()
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var titleView: UIView!
    @IBOutlet weak var bodyView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        scrollView.delegate = self
        scrollView.contentSize = view.bounds.size
        scrollView.autoresizingMask = UIViewAutoresizing.FlexibleHeight
        
        initializeView()
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
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Populate with evaluation information
    func initializeView() {
        iterateThroughEvaluationPoints()
    }
    
    func iterateThroughEvaluationPoints() {
        let screenSize: CGRect = UIScreen.mainScreen().bounds
        let screenWidth: Int = Int(screenSize.width)

        let startX  = 25
        let startY = isLandscape() ? 25 : 10
        
        let labelHeight = 25
        let keyWidth = 200
        let descriptionWidth = screenWidth - (startX * 2)
        let descriptionHeight = 25
        
        let subHeaderFontSize: CGFloat = UIDevice.currentDevice().userInterfaceIdiom == .Pad ? 20 : 16
        let descriptionFontSize: CGFloat = UIDevice.currentDevice().userInterfaceIdiom == .Pad ? 16 : 12
        let count = evaluationViewModel.getCount()
        
        var previousDescHeight: Int = 0
        var Y = startY
        
        // Adjustment for iPads
        if UIDevice.currentDevice().userInterfaceIdiom == .Pad {
            Y += 50
            if isLandscape() {
                Y += 50
            }
            Y += UIDevice.currentDevice().modelName == "iPad Pro" ? 75 : 0
        }
        
        for var i = 0; i < count; i++ {
            let key = evaluationViewModel.getKey(i)
            let keyValue = evaluationViewModel.getDescriptionValueFromKey(key)
            
            Y += Int(previousDescHeight) + labelHeight + 10
            if let description = keyValue {
                let labelRect = CGRect(x: startX, y: Y, width: keyWidth, height: labelHeight)
                let label = UILabel(frame: labelRect)
                label.text = key
                label.font = UIFont.boldSystemFontOfSize(subHeaderFontSize)
                label.textAlignment = .Left
                label.textColor = UIColor(hexString: "#3F3C2D")
                bodyView.addSubview(label)
                
                // use font information from the UILabel to calculate the size
                let descRect = CGRect(x: startX, y: Y + labelHeight, width: descriptionWidth, height: descriptionHeight)
                let labelDesc = UILabel(frame: descRect)
                labelDesc.text = description
                labelDesc.font = labelDesc.font.fontWithSize(descriptionFontSize)
                labelDesc.numberOfLines = 0
                labelDesc.textColor = UIColor(hexString: "#3F3C2D")
                labelDesc.sizeToFit()
                bodyView.addSubview(labelDesc)
                previousDescHeight = Int(labelDesc.frame.height)
            }
            scrollView.contentSize.height = titleView.bounds.height + CGFloat(Y) + 75
        }
    }
    
    // Helper bool function to check whether device is in landscape mode
    func isLandscape() -> Bool {
        if UIDevice.currentDevice().orientation == UIDeviceOrientation.LandscapeLeft ||
            UIDevice.currentDevice().orientation == UIDeviceOrientation.LandscapeRight {
                return true
        }
        return false
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