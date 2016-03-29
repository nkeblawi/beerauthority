//
//  PageItemController.swift
//  BeerApp_beta
//
//  Created by Nabeel Keblawi on 9/25/15.
//  Copyright © 2015 Nabeel Keblawi. All rights reserved.
//

import UIKit

class PageItemController: UIViewController {
    
    @IBOutlet weak var strBeerLabel: UILabel!
    @IBOutlet weak var beerImage: UIImageView!
    @IBOutlet weak var buttonRecommendedURL: UIButton!
    
    var itemIndex: Int = 0
    var urlString: String = "http://www.ratebeer.com"
    var glasses: [Glass]? = nil
    var beerName: String = "" {
        didSet {
            if let beerLabel = strBeerLabel {
                beerLabel.text = beerName
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillLayoutSubviews() {
        populatePageInfo()
    }
    
    override func didRotateFromInterfaceOrientation(fromInterfaceOrientation: UIInterfaceOrientation) {
        navigationController?.navigationBarHidden = isLandscape() ? true : false
    }
    
    @IBAction func getRecommendedGlassware(sender: AnyObject) {
        // no code here because prepareForSegue: has all the functionality
    }
    
    // Change the image view mode
    func setImageContentMode(imageView: UIImageView) {
        if isLandscape() {
            imageView.clipsToBounds = false
            imageView.contentMode = UIViewContentMode.Redraw
        } else {
            imageView.clipsToBounds = true
            imageView.contentMode = deviceIs4Inch() ?
                UIViewContentMode.ScaleAspectFit :
                UIViewContentMode.ScaleAspectFill
        }
    }
    
    // Populate page item with beer information
    func populatePageInfo() {
        strBeerLabel.text = beerName
        
        let bundlePath = NSBundle.mainBundle().pathForResource(beerName, ofType: "jpg")
        beerImage.image = UIImage(contentsOfFile: bundlePath!)
        setImageContentMode(beerImage)
        
        buttonRecommendedURL.setTitle("Top Rated \(beerName)s", forState: .Normal)
        buttonRecommendedURL.tintColor = UIColor(hexString: "#E66000")
    }
    
    // Send user to recommended bear search listing when user clicks this button
    @IBAction func GotoURL(sender: AnyObject) {
        let url = NSURL(string: urlString)!
        UIApplication.sharedApplication().openURL(url)
    }
    
    // Helper bool function to check whether device is in landscape mode
    func isLandscape() -> Bool {
        if UIDevice.currentDevice().orientation == UIDeviceOrientation.LandscapeLeft ||
            UIDevice.currentDevice().orientation == UIDeviceOrientation.LandscapeRight {
                return true
        }
        return false
    }
    
    // Helper bool function to check whether device is a 4 inch iphone
    func deviceIs4Inch() -> Bool {
        if UIScreen.mainScreen().bounds.height < 500.0 {
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
