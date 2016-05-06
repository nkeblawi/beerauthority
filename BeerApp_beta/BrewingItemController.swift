//
//  BrewingItemController.swift
//  BeerApp_beta
//
//  Created by Nabeel Keblawi on 11/1/15.
//  Copyright © 2015 Maliszewksi Enterprises, LLC. All rights reserved.
//

import UIKit

class BrewingItemController: UIViewController {

    @IBOutlet weak var brewImageView: UIImageView!
    @IBOutlet weak var brewInstructionsLabel: PaddingLabel!
    
    let device = UIDevice.currentDevice().userInterfaceIdiom
    var itemIndex: Int = 0
    var brewingStepName: String = ""
    var brewInstructions: String = "" {
        didSet {
            if let instructionsLabel = brewInstructionsLabel {
                instructionsLabel.text = brewInstructions
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        populatePageInfo()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillLayoutSubviews() {
        //populatePageInfo()
    }
    
    override func didRotateFromInterfaceOrientation(fromInterfaceOrientation: UIInterfaceOrientation) {
        navigationController?.navigationBarHidden = UIDevice.isLandscape() ? true : false
        populatePageInfo()
    }
    
    func setImageContentMode(imageView: UIImageView) {
        imageView.clipsToBounds = false
        imageView.contentMode = UIViewContentMode.ScaleAspectFit
    }
    
    func populatePageInfo() {
        let bundlePath = NSBundle.mainBundle().pathForResource(brewingStepName, ofType: "png")
        brewImageView.image = UIImage(contentsOfFile: bundlePath!)
        setImageContentMode(brewImageView)
        
        let fontsize: CGFloat = (device == .Pad) ? 20 : 14
        brewInstructionsLabel.text = brewInstructions
        brewInstructionsLabel.font = brewInstructionsLabel.font.fontWithSize(fontsize)
        brewInstructionsLabel.hidden = UIDevice.is4Inch() ? true : false
        brewInstructionsLabel.numberOfLines = 0
        brewInstructionsLabel.sizeToFit()
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
