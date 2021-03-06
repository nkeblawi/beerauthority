//
//  BeerViewModel.swift
//  BeerApp_beta
//
//  Created by Nabeel Keblawi on 9/26/15.
//  Copyright © 2015 Maliszewksi Enterprises, LLC. All rights reserved.
//

import Foundation
import UIKit

class BeerViewModel {

    private let beers: [Beer]
    
    init() {
        beers = [
            Amber(),
            Barleywine(),
            Belgian(),
            IPA(),
            Lambic(),
            Pilsner(),
            Porter(),
            Sour(),
            Stout(),
            Witbier()
        ]
    }
    
    func getCount() -> Int {
        return beers.count
    }
    
    func getBeerName(itemIndex: Int) -> String {
        return beers[itemIndex].getName()
    }
    
    func getDisplayBeerName(itemIndex: Int) -> String {
        return beers[itemIndex].getDisplayName()
    }
    
    func getGlasswareChoices(itemIndex: Int) -> [Glass]? {
        if let glassesArray = beers[itemIndex].getGlasswareChoices() {
            return glassesArray
        }
        return nil
    }
    
    func getRecommendedURL(itemIndex: Int) -> String {
        var urlString = "http://www.ratebeer.com/"
        if let url = beers[itemIndex].getUrlString() {
            urlString = url
        }
        return urlString
    }
    
    func getBeerDescription(itemIndex: Int) -> String {
        var beerDescription = ""
        if let description = beers[itemIndex].getBeerDescription() {
            beerDescription = description
        }
        return beerDescription
    }
}