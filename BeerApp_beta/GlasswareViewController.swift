//
//  GlasswareViewController.swift
//  BeerApp_beta
//
//  Created by Nabeel Keblawi on 9/25/15.
//  Copyright © 2015 Maliszewksi Enterprises, LLC. All rights reserved.
//

import UIKit

class GlasswareViewController: UIViewController, UIScrollViewDelegate {
    
    private let glasswareViewModel = GlasswareViewModel()
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var bodyView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        scrollView.delegate = self
        if let lastView = scrollView.subviews.last {
            var sizeOfContent: CGFloat = 0
            let wd: CGFloat = lastView.frame.origin.y
            let ht: CGFloat = lastView.frame.size.height
            sizeOfContent = wd + ht
            scrollView.contentSize = CGSizeMake(scrollView.frame.size.width, sizeOfContent)
        }
        initializeView()
    }
    
    override func viewWillAppear(animated: Bool) {
        self.navigationItem.title = "Glassware"
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor(hexString: "#3F3C2D")]
    }
    
    override func viewWillDisappear(animated: Bool) {
        self.navigationItem.title = "Glassware Controller"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidLayoutSubviews() {
        let scrollViewBounds = scrollView.bounds
        let containerViewBounds = contentView.bounds
        
        var scrollViewInsets = UIEdgeInsetsZero
        scrollViewInsets.top = scrollViewBounds.size.height/2.0;
        scrollViewInsets.top -= containerViewBounds.size.height/2.0;
        
        scrollViewInsets.bottom = scrollViewBounds.size.height/2.0
        scrollViewInsets.bottom -= containerViewBounds.size.height/2.0;
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

    // Populate the view page with glassware information
    func initializeView() {
        iterateThroughGlassArray()
    }
    
    func iterateThroughGlassArray() {
        let screenSize: CGRect = UIScreen.mainScreen().bounds
        let screenWidth: Int = Int(screenSize.width)
        
        let startX = 25
        let startY = 0
        let imageWidth = 50
        let imageHeight = 50
        let labelHeight = 15
        let descriptionWidth = screenWidth - (startX * 2) - imageWidth
        
        let fontSize: CGFloat = UIDevice.currentDevice().userInterfaceIdiom == .Pad ? 16 : 12
        let count = glasswareViewModel.getCount()
        
        var previousDescHeight: Int = 0
        var Y = startY
        
        for i in 0 ..< count {
            let deltaY = Int(previousDescHeight) + labelHeight
            if (deltaY < imageHeight + labelHeight) {
                Y += deltaY + labelHeight
            } else {
                Y += deltaY
            }
            if UIDevice.currentDevice().userInterfaceIdiom == .Pad {
                Y += 20
            }
            
            // Adjustment on labels and graphics for iPads
            let width = UIDevice.currentDevice().userInterfaceIdiom == .Pad ? imageWidth + 25 : imageWidth
            
            let glassName = glasswareViewModel.getName(i)
            let labelRect = CGRect(x: startX, y: Y, width: width, height: labelHeight)
            let label = UILabel(frame: labelRect)
            label.text = glassName
            label.font = UIFont.boldSystemFontOfSize(fontSize)
            label.textColor = UIColor(hexString: "#3F3C2D")
            label.textAlignment = .Center
            bodyView.addSubview(label)
            
            let imageName = glassName
            let imageView = UIImageView()
            let bundlePath = NSBundle.mainBundle().pathForResource(imageName, ofType: "jpg")
            imageView.image = UIImage(contentsOfFile: bundlePath!)
            imageView.contentMode = UIViewContentMode.ScaleAspectFit
            imageView.frame = CGRect(x: startX, y: Y + labelHeight, width: width, height: imageHeight)
            bodyView.addSubview(imageView)
            
            // Adjustment on description widths for iPads
            let descWidth = UIDevice.currentDevice().userInterfaceIdiom == .Pad ? descriptionWidth - 50 : descriptionWidth
            
            let X = UIDevice.currentDevice().userInterfaceIdiom == .Pad ? imageWidth + 25 : imageWidth
            let glassDescription = glasswareViewModel.getDescription(i)
            let descRect = CGRect(x: startX + X, y: Y, width: descWidth, height: imageHeight + labelHeight)
            let labelDesc = UILabel(frame: descRect)
            labelDesc.text = glassDescription
            labelDesc.font = labelDesc.font.fontWithSize(fontSize)
            labelDesc.numberOfLines = 0
            labelDesc.textColor = UIColor(hexString: "#3F3C2D")
            labelDesc.sizeToFit()
            bodyView.addSubview(labelDesc)
            
            previousDescHeight = Int(labelDesc.frame.height)
        }
        scrollView.contentSize.height = CGFloat(Y) * 1.3
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
