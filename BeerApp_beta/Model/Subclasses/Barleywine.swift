//
//  Barleywine.swift
//  BeerApp_beta
//
//  Created by Nabeel Keblawi on 9/21/15.
//  Copyright © 2015 Nabeel Keblawi. All rights reserved.
//

import Foundation

class Barleywine: Beer {
    init() {
        super.init(beerType: BeerType.Barleywine)
        super.recommendedUrlString = "http://www.ratebeer.com/beerstyles/barley-wine/11/"
        
        super.glasswareChoices = [Glass(glassType: GlassType.Snifter)]
        
        super.ingredients = [Ingredient(ingredientType: IngredientType.Pumpkin)]
        super.ingredients?.append(Ingredient(ingredientType: IngredientType.Malt))
    }
}