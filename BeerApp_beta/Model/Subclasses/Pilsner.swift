//
//  Pilsner.swift
//  BeerApp_beta
//
//  Created by Nabeel Keblawi on 9/21/15.
//  Copyright © 2015 Nabeel Keblawi. All rights reserved.
//

import Foundation

class Pilsner: Beer {
    init() {
        super.init(beerType: BeerType.Pilsner)
        super.recommendedUrlString = "http://www.ratebeer.com/beerstyles/pilsener/4/"
        
        super.glasswareChoices = [Glass(glassType: GlassType.Mug)]
        
        super.ingredients = [Ingredient(ingredientType: IngredientType.Hops)]
    }
}