//
//  PairingViewController.swift
//  BeerApp_beta
//
//  Created by Nabeel Keblawi on 10/28/15.
//  Copyright © 2015 Maliszewksi Enterprises, LLC. All rights reserved.
//

import UIKit

class PairingViewController: UIViewController, UIScrollViewDelegate {

    override func viewWillAppear(animated: Bool) {
        self.navigationItem.title = "Food Pairing"
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor(hexString: "#3F3C2D")]
    }
    
    override func viewWillDisappear(animated: Bool) {
        self.navigationItem.title = "Food Pairing Controller"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(animated: Bool) {
        // Prompt to rate app
        let rate = RateMyApp.sharedInstance
        
        dispatch_async(dispatch_get_main_queue(), { () -> Void in
            rate.trackAppUsage()
        })
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
