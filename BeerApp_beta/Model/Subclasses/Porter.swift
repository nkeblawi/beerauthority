//
//  Porter.swift
//  BeerApp_beta
//
//  Created by Nabeel Keblawi on 9/21/15.
//  Copyright © 2015 Nabeel Keblawi. All rights reserved.
//

import Foundation

class Porter: Beer {
    init() {
        super.init(beerType: BeerType.Porter)
        super.recommendedUrlString = "http://www.ratebeer.com/beerstyles/porter/5/"
        
        super.glasswareChoices = [Glass(glassType: GlassType.Snifter)]
        
        super.ingredients = [Ingredient(ingredientType: IngredientType.Coffee)]
        super.ingredients?.append(Ingredient(ingredientType: IngredientType.Licorice))
    }
}