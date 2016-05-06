//
//  BeerGlassViewController.swift
//  BeerApp_beta
//
//  Created by Nabeel Keblawi on 11/1/15.
//  Copyright © 2015 Nabeel Keblawi. All rights reserved.
//

import UIKit

class BeerGlassViewController: UIViewController, UIScrollViewDelegate {
    
    private let glasswareViewModel = GlasswareViewModel()
    var beerName: String?
    var glassesArray: [Glass]?

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var bodyView: UIView!
    @IBOutlet weak var strRecommendedGlasswareTitle: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        scrollView.delegate = self
        scrollView.contentSize = view.bounds.size
        scrollView.autoresizingMask = UIViewAutoresizing.FlexibleHeight
        
        self.title = "Beer 101"
        if let nameOfBeer = beerName {
            strRecommendedGlasswareTitle.text = "Glassware for \(nameOfBeer)s"
        }
        
        initializeView()
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
    
    func initializeView() {
        displayListOfGlassesForBeer()
    }
    
    func displayListOfGlassesForBeer() {
        let screenSize: CGRect = UIScreen.mainScreen().bounds
        let screenWidth: Int = Int(screenSize.width)
        
        let startX = 25
        let startY = 0
        let imageWidth = 50
        let imageHeight = 50
        let labelHeight = 15
        let descriptionWidth = screenWidth - (startX * 2) - imageWidth
        
        let fontSize: CGFloat = 12
        
        var previousDescHeight: Int = 0
        var Y = startY
        
        if let beerGlassArray = glassesArray {
            for (_, glass) in beerGlassArray.enumerate() {
                let deltaY = Int(previousDescHeight) + labelHeight
                if (deltaY < imageHeight + labelHeight) {
                    Y += deltaY + labelHeight
                } else {
                    Y += deltaY
                }
                
                let glassName = glass.getName()
                let labelRect = CGRect(x: startX, y: Y, width: imageWidth, height: labelHeight)
                let label = UILabel(frame: labelRect)
                label.text = glassName
                label.font = UIFont.boldSystemFontOfSize(fontSize)
                label.textAlignment = .Center
                bodyView.addSubview(label)
                
                let imageName = glassName
                let imageView = UIImageView()
                let bundlePath = NSBundle.mainBundle().pathForResource(imageName, ofType: "jpg")
                imageView.image = UIImage(contentsOfFile: bundlePath!)
                imageView.contentMode = UIViewContentMode.ScaleAspectFit
                imageView.frame = CGRect(x: startX, y: Y + labelHeight, width: imageWidth, height: imageHeight)
                bodyView.addSubview(imageView)
                
                let glassDescription = glass.getDescription()
                let descRect = CGRect(x: startX + imageWidth, y: Y, width: descriptionWidth, height: imageHeight + labelHeight)
                let labelDesc = UILabel(frame: descRect)
                labelDesc.text = glassDescription
                labelDesc.font = labelDesc.font.fontWithSize(fontSize)
                labelDesc.numberOfLines = 0
                labelDesc.sizeToFit()
                bodyView.addSubview(labelDesc)
                
                previousDescHeight = Int(labelDesc.frame.height)
            }
            scrollView.contentSize.height = CGFloat(Y)
        }
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
