//
//  PageItemController.swift
//  BeerApp_beta
//
//  Created by Nabeel Keblawi on 9/25/15.
//  Copyright © 2015 Maliszewksi Enterprises, LLC. All rights reserved.
//

import UIKit

class PageItemController: UIViewController {
    
    @IBOutlet weak var strBeerLabel: UILabel!
    @IBOutlet weak var beerImage: UIImageView!
    @IBOutlet weak var buttonRecommendedURL: UIButton!
    @IBOutlet weak var beerDescriptionLabel: PaddingLabel!
    @IBOutlet weak var upArrowImage: UIImageView!
    
    var itemIndex: Int = 0
    var urlString: String = "http://www.ratebeer.com"
    var glasses: [Glass]? = nil
    var beerDescription = ""

    var beerName: String = ""
    var displayBeerName: String = "" {
        didSet {
            if let beerLabel = strBeerLabel {
                beerLabel.text = displayBeerName
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        beerDescriptionLabel.hidden = true
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.imageTapped(_:)))
        let swipeGestureUp = UISwipeGestureRecognizer(target: self, action: #selector(self.displayBeerDescription(_:)))
        let swipeGestureDown = UISwipeGestureRecognizer(target: self, action: #selector(self.displayBeerDescription(_:)))
        swipeGestureUp.direction = .Up
        swipeGestureDown.direction = .Down
        
        beerImage.userInteractionEnabled = true
        beerImage.addGestureRecognizer(tapGesture)
        beerImage.addGestureRecognizer(swipeGestureUp)
        beerImage.addGestureRecognizer(swipeGestureDown)
    }
    
    override func viewWillDisappear(animated: Bool) {
        beerDescriptionLabel.text = nil
        beerDescriptionLabel.hidden = true
    }
    
    override func viewWillLayoutSubviews() {
        populatePageInfo()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func didRotateFromInterfaceOrientation(fromInterfaceOrientation: UIInterfaceOrientation) {
        //navigationController?.navigationBarHidden = isLandscape() ? true : false
    }
    
    @IBAction func getRecommendedGlassware(sender: AnyObject) {
        // no code here because prepareForSegue: has all the functionality
    }
    
    // Change the image view mode
    func setImageContentMode(imageView: UIImageView) {
        imageView.clipsToBounds = true
        if UIDevice.isLandscape() {
            imageView.contentMode = UIViewContentMode.Redraw
        } else {
            imageView.contentMode = UIDevice.is4Inch() ?
                UIViewContentMode.ScaleAspectFit : UIViewContentMode.ScaleAspectFill
        }
        beerImage.addSubview(upArrowImage)
    }
    
    // Populate page item with beer information
    func populatePageInfo() {
        if displayBeerName == "Lambic" {
            strBeerLabel.text = displayBeerName + "/Fruit"
        } else {
            strBeerLabel.text = displayBeerName
        }
        
        buttonRecommendedURL.setTitle("Top Rated \(displayBeerName)s", forState: .Normal)
        buttonRecommendedURL.tintColor = UIColor(hexString: "#E66000")
        
        let bundlePath = NSBundle.mainBundle().pathForResource(beerName, ofType: "jpg")
        beerImage.image = UIImage(contentsOfFile: bundlePath!)
        setImageContentMode(beerImage)
    }
    
    // Send user to recommended bear search listing when user clicks this button
    @IBAction func GotoURL(sender: AnyObject) {
        openRatingsURL()
    }
    
    // Open beer rating list URL
    func openRatingsURL() {
        let url = NSURL(string: urlString)!
        UIApplication.sharedApplication().openURL(url)
    }
    
    // #SELECTOR FUNCTION - Send user to above URL when image is tapped
    func imageTapped(sender: UITapGestureRecognizer? = nil) {
        openRatingsURL()
    }
    
    // #SELECTOR FUNCTION - Send user to above URL when image is tapped
    func displayBeerDescription(sender: UISwipeGestureRecognizer? = nil) {
        if (sender?.direction == .Up && beerDescriptionLabel.hidden) {
            let fontSize: CGFloat = UIDevice.currentDevice().userInterfaceIdiom == .Pad ? 20 : 12
            beerDescriptionLabel.font = beerDescriptionLabel.font.fontWithSize(fontSize)
            beerDescriptionLabel.text = beerDescription
            beerDescriptionLabel.numberOfLines = 0
            beerDescriptionLabel.sizeToFit()
            beerDescriptionLabel.hidden = false
        } else if (sender?.direction == .Down && !beerDescriptionLabel.hidden){
            beerDescriptionLabel.text = nil
            beerDescriptionLabel.hidden = true
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
