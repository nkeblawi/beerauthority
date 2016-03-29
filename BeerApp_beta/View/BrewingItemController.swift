//
//  BrewingItemController.swift
//  BeerApp_beta
//
//  Created by Nabeel Keblawi on 11/1/15.
//  Copyright © 2015 Nabeel Keblawi. All rights reserved.
//

import UIKit

class BrewingItemController: UIViewController {

    @IBOutlet weak var brewImageView: UIImageView!
    @IBOutlet weak var brewInstructionsLabel: UILabel!
    
    var itemIndex: Int = 0
    var brewingStepName: String = ""
    var brewInstructions: String = "" {
        didSet {
            if let instructionsLabel = brewInstructionsLabel {
                instructionsLabel.text = brewInstructions
            }
        }
    }
    
    let device = UIDevice.currentDevice().userInterfaceIdiom

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
    
    func setImageContentMode(imageView: UIImageView) {
        brewInstructionsLabel.hidden = (device != .Pad && isLandscape()) ? true : false
        brewInstructionsLabel.text = (device != .Pad && isLandscape()) ? "" : brewInstructions
        imageView.clipsToBounds = false
        imageView.contentMode = UIViewContentMode.ScaleAspectFit
    }
    
    func populatePageInfo() {
        brewInstructionsLabel.text = brewInstructions
        brewInstructionsLabel.adjustsFontSizeToFitWidth = true
        brewInstructionsLabel.sizeToFit()
        
        if device == .Pad {
            brewInstructionsLabel.font = brewInstructionsLabel.font.fontWithSize(20)
        }
        
        let bundlePath = NSBundle.mainBundle().pathForResource(brewingStepName, ofType: "png")
        brewImageView.image = UIImage(contentsOfFile: bundlePath!)
        setImageContentMode(brewImageView)
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
