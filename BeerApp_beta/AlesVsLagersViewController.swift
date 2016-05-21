//
//  AlesVsLagersViewController.swift
//  BeerAuthority
//
//  Created by Nabeel Keblawi on 5/2/16.
//  Copyright © 2016 Nabeel Keblawi. All rights reserved.
//

import UIKit

class AlesVsLagersViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet var scrollView: UIScrollView!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var bodyView: UIView!
    @IBOutlet weak var titleView: UIView!
    
    @IBOutlet weak var AlesVsLagersImage: UIImageView!
    var AlesVsLagersLabel: UILabel = UILabel()
    
    let device = UIDevice.currentDevice().userInterfaceIdiom
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        scrollView.delegate = self
        scrollView.contentSize = view.bounds.size
        scrollView.autoresizingMask = UIViewAutoresizing.FlexibleHeight
    }
    
    override func viewWillAppear(animated: Bool) {
        self.navigationItem.title = "Ales vs. Lagers"
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor(hexString: "#3F3C2D")]
        populatePageInfo()
    }
    
    override func viewWillDisappear(animated: Bool) {
        scrollView.contentOffset = CGPointMake(0, 0);
        for view in bodyView.subviews {
            view.removeFromSuperview()
        }
    }
    
    override func viewWillLayoutSubviews() {
        let scrollViewBounds = scrollView.bounds
        let containerViewBounds = contentView.bounds
        
        var scrollViewInsets = UIEdgeInsetsZero
        scrollViewInsets.top = scrollViewBounds.size.height / 2.0;
        scrollViewInsets.top -= containerViewBounds.size.height / 2.0;
        
        scrollViewInsets.bottom = scrollViewBounds.size.height / 2.0
        scrollViewInsets.bottom -= containerViewBounds.size.height / 2.0;
        scrollViewInsets.bottom += 1
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func didRotateFromInterfaceOrientation(fromInterfaceOrientation: UIInterfaceOrientation) {
        navigationController?.navigationBarHidden = UIDevice.isLandscape() ? true : false
        populatePageInfo()
    }
    
    func populatePageInfo() {
        let screenSize: CGRect = UIScreen.mainScreen().bounds
        let screenWidth: Int = Int(screenSize.width)
        
        let startX = 25
        let startY = 25
        let descriptionWidth = screenWidth - (startX * 2)
        
        let fontSize: CGFloat = UIDevice.currentDevice().userInterfaceIdiom == .Pad ? 16 : 12
        let descRect = CGRect(x: startX, y: startY, width: descriptionWidth, height: 800)
        
        AlesVsLagersLabel.frame = descRect
        AlesVsLagersLabel.text = "There are only two main types of beer: Ales and Lagers. The significant differences between these two types are the way they ferment." + "\r\n" +
            "\r\n" +
            "Ales are known as top fermenters and can ferment in just a few days. Ales ferment between 68 and 76 degrees. Ales tend to have heavier bodies, more alcohol, a darker hue and are cloudier than lagers." + "\r\n" +
            "\r\n" +
            "Lagers are bottom fermenters. They take much longer to ferment, anywhere from one to three months, and ferment at a much colder temperature than ales. Lagers will have a cleaner taste and appearance. Lagers also are less hoppy, maltier and have a lighter body than ales. Lagers were invented by Bavarian Monks about 500 years ago when they found they could produce a clearer brew by storing it during the summer in wooden casks in cold subterranean caves." + "\r\n"
        
        AlesVsLagersLabel.font = AlesVsLagersLabel.font.fontWithSize(fontSize)
        AlesVsLagersLabel.numberOfLines = 0
        AlesVsLagersLabel.textColor = UIColor(hexString: "#3F3C2D")
        AlesVsLagersLabel.sizeToFit()
        bodyView.addSubview(AlesVsLagersLabel)
        scrollView.contentSize.height = titleView.bounds.height + AlesVsLagersLabel.bounds.height + CGFloat(startY)
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
