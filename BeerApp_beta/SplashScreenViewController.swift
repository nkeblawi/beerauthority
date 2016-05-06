//
//  SplashScreenViewController.swift
//  BeerAuthority
//
//  Created by Nabeel Keblawi on 1/24/16.
//  Copyright © 2015 Maliszewksi Enterprises, LLC. All rights reserved.
//

import UIKit

class SplashScreenViewController: UIViewController {

    @IBOutlet weak var animatedImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        addAnimation()
        
        NSTimer.scheduledTimerWithTimeInterval(
            4.0, target: self, selector: #selector(SplashScreenViewController.continueToApp), userInfo: nil, repeats: false
        )
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Adds animated image to the splash screen
    func addAnimation() {
        var imagesListArray: [UIImage] = []
        var strImageName: String
        for i in 0...90
        {
            var imageNumber: String = String(i)
            strImageName = "beerapp_final_000"
            if i < 10 {
                strImageName += "0"
            }
            if i > 84 {
                imageNumber = "84"
            }
            strImageName += imageNumber + ".jpg"
            let image  = UIImage(named:strImageName)
            imagesListArray.append(image!)
        }
        
        self.animatedImageView.animationImages = imagesListArray;
        self.animatedImageView.animationDuration = 4.0
        self.animatedImageView.startAnimating()
    }
    
    func continueToApp() {
        self.performSegueWithIdentifier("continueToApp", sender: self)
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
