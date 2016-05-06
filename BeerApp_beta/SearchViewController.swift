//
//  SearchViewController.swift
//  BeerAuthority
//
//  Created by Nabeel Keblawi on 4/22/16.
//  Copyright © 2016 Nabeel Keblawi. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController, UIWebViewDelegate {

    @IBOutlet weak var indicator: UIActivityIndicatorView!
    @IBOutlet weak var searchWebView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let url = NSURL(string: "http://www.ratebeer.com/m/")
        let requestObj = NSURLRequest(URL: url!);
        
        searchWebView.delegate = self
        UIWebView.loadRequest(searchWebView)(requestObj);
        
        indicator.hidesWhenStopped = true
    }
    
    override func viewWillAppear(animated: Bool) {
        self.navigationItem.title = "Search"
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor(hexString: "#3F3C2D")]
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
    
    func webViewDidStartLoad(webView: UIWebView) {
        indicator.startAnimating()
    }
    
    func webViewDidFinishLoad(webView: UIWebView) {
        indicator.stopAnimating()
    }

    @IBAction func reload(sender: AnyObject) {
        searchWebView.reload()
    }
    @IBAction func goForward(sender: AnyObject) {
        if searchWebView.canGoForward {
            searchWebView.goForward()
        }
    }
    @IBAction func goBack(sender: AnyObject) {
        if searchWebView.canGoBack {
            searchWebView.goBack()
        }
    }
}
