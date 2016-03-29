//
//  Stout.swift
//  BeerApp_beta
//
//  Created by Nabeel Keblawi on 9/21/15.
//  Copyright © 2015 Nabeel Keblawi. All rights reserved.
//

import Foundation

class Stout: Beer {
    init() {
        super.init(beerType: BeerType.Stout)
        super.recommendedUrlString = "http://www.ratebeer.com/beerstyles/stout/6/"
        
        super.glasswareChoices = [Glass(glassType: GlassType.Snifter)]
        
        super.ingredients = [Ingredient(ingredientType: IngredientType.Coffee)]
        super.ingredients?.append(Ingredient(ingredientType: IngredientType.Chocolate))
    }
}