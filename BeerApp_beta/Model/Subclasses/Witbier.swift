//
//  Witbier.swift
//  BeerApp_beta
//
//  Created by Nabeel Keblawi on 9/21/15.
//  Copyright © 2015 Nabeel Keblawi. All rights reserved.
//

import Foundation

class Witbier: Beer {
    init() {
        super.init(beerType: BeerType.Witbier)
        super.recommendedUrlString = "http://www.ratebeer.com/beerstyles/witbier/48/"
        
        super.glasswareChoices = [Glass(glassType: GlassType.Weizen)]
        
        super.ingredients = [Ingredient(ingredientType: IngredientType.Wheat)]
    }
}