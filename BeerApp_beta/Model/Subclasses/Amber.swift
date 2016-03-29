//
//  Amber.swift
//  BeerApp_beta
//
//  Created by Nabeel Keblawi on 9/21/15.
//  Copyright © 2015 Nabeel Keblawi. All rights reserved.
//

import Foundation

class Amber: Beer {
    init() {
        super.init(beerType: BeerType.Amber)
        super.recommendedUrlString = "http://www.ratebeer.com/beerstyles/amber-ale/53/"
        
        super.glasswareChoices = [Glass(glassType: GlassType.Pint)]
        super.glasswareChoices?.append(Glass(glassType: GlassType.Goblet))
        
        super.ingredients = [Ingredient(ingredientType: IngredientType.Hops)]
    }
}