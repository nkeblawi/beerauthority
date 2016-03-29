//
//  Belgian.swift
//  BeerApp_beta
//
//  Created by Nabeel Keblawi on 9/21/15.
//  Copyright © 2015 Nabeel Keblawi. All rights reserved.
//

import Foundation

class Belgian: Beer {
    init() {
        super.init(beerType: BeerType.Belgian)
        super.recommendedUrlString = "http://www.ratebeer.com/beerstyles/belgian-ale/12/"
        
        super.glasswareChoices = [Glass(glassType: GlassType.Goblet)]
        
        super.ingredients = [Ingredient(ingredientType: IngredientType.Pumpkin)]
        super.ingredients?.append(Ingredient(ingredientType: IngredientType.Malt))
        super.ingredients?.append(Ingredient(ingredientType: IngredientType.Hops))
    }
}