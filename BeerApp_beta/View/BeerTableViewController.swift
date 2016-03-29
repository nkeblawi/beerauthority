//
//  BeerTableViewController.swift
//  BeerApp_beta
//
//  Created by Nabeel Keblawi on 11/26/15.
//  Copyright © 2015 Nabeel Keblawi. All rights reserved.
//

import UIKit

class BeerTableViewController: UITableViewController {

    private let beerViewModel = BeerViewModel()
    var beerNames = [String]()
    var indexRow: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        loadBeerData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return beerNames.count
    }

    func loadBeerData() {
        let count = beerViewModel.getCount()
        for index in 0..<count {
            beerNames.append(beerViewModel.getBeerName(index))
        }
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIdentifier = "BeerTableViewCell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! BeerTableViewCell

        let beerName = "\(beerNames[indexPath.row])_Ingr"
        
        let bundlePath = NSBundle.mainBundle().pathForResource(beerName, ofType: "png")
        cell.beerTableViewImage.image = UIImage(contentsOfFile: bundlePath!)
        cell.beerTableViewLabel.text = beerNames[indexPath.row]
        
        return cell
    }
}
