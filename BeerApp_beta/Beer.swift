//
//  Beer.swift
//  BeerApp_beta
//
//  Created by Nabeel Keblawi on 9/21/15.
//  Copyright © 2015 Maliszewksi Enterprises, LLC. All rights reserved.
//

import Foundation

class Beer {
    private let beerType: BeerType
    private let beerName: String
    private var displayBeerName: String
    
    var recommendedUrlString: String?
    var glasswareChoices: [Glass]?
    var ingredients: [Ingredient]?
    var beerDescription: String?
    
    init(beerType: BeerType) {
        self.beerType = beerType
        self.beerName = self.beerType.rawValue
        self.displayBeerName = self.beerName
        
        if self.displayBeerName == "Witbier" {
            self.displayBeerName = "Hefeweizen"
        } else if self.displayBeerName == "Belgian" {
            self.displayBeerName = "Belgian Tripel"
        }
    }
    
    func getName() -> String {
        return self.beerName
    }
    
    func getDisplayName() -> String {
        return self.displayBeerName
    }
    
    func getUrlString() -> String? {
        return self.recommendedUrlString
    }
    
    func getGlasswareChoices() -> [Glass]? {
        return self.glasswareChoices
    }
    
    func getIngredients() -> [Ingredient]? {
        return self.ingredients
    }
    
    func getBeerDescription() -> String? {
        return self.beerDescription
    }
}