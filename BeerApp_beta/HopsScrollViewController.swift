//
//  HopsScrollViewController.swift
//  BeerAuthority
//
//  Created by Nabeel Keblawi on 4/24/16.
//  Copyright © 2016 Nabeel Keblawi. All rights reserved.
//

import UIKit

class HopsScrollViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        scrollView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        updateMinZoomScaleForSize(scrollView.bounds.size)
    }
    
    func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView? {
        return imageView
    }
    
    private func updateMinZoomScaleForSize(scrollViewSize: CGSize) {
        let widthScale = scrollViewSize.width / imageView.bounds.width
        //let heightScale = scrollViewSize.height / UIScreen.mainScreen().bounds.height
        //let minScale = min(widthScale, heightScale)
        let minScale = widthScale
        
        scrollView.minimumZoomScale = minScale
        scrollView.zoomScale = minScale
        setImageContentMode(imageView)
    }
    
    func setImageContentMode(imageView: UIImageView) {
        imageView.clipsToBounds = false
        imageView.contentMode = UIDevice.isLandscape() ? .Center : .ScaleAspectFill
        scrollViewDidZoom(scrollView)
    }

    func scrollViewDidZoom(scrollView: UIScrollView) {
        let imageViewSize = imageView.frame.size
        let scrollViewSize = scrollView.bounds.size
        let horizontalPadding = imageViewSize.width < scrollViewSize.width ? (scrollViewSize.width - imageViewSize.width) / 2 : 0
        scrollView.contentInset = UIEdgeInsets(top: 0, left: horizontalPadding, bottom: 0, right: horizontalPadding)
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
