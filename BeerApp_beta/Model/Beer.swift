//
//  Beer.swift
//  BeerApp_beta
//
//  Created by Nabeel Keblawi on 9/21/15.
//  Copyright © 2015 Nabeel Keblawi. All rights reserved.
//

import Foundation

class Beer {
    private let beerType: BeerType
    private let beerName: String
    
    var recommendedUrlString: String?
    var glasswareChoices: [Glass]?
    var ingredients: [Ingredient]?
    
    init(beerType: BeerType) {
        self.beerType = beerType
        self.beerName = self.beerType.rawValue
    }
    
    func getName() -> String {
        return self.beerName
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
}