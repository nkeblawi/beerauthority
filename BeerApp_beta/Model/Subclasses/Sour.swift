//
//  Sour.swift
//  BeerApp_beta
//
//  Created by Nabeel Keblawi on 9/21/15.
//  Copyright © 2015 Nabeel Keblawi. All rights reserved.
//

import Foundation

class Sour: Beer {
    init() {
        super.init(beerType: BeerType.Sour)
        super.recommendedUrlString = "http://www.ratebeer.com/beerstyles/sour-wild-ale/52/"
        
        super.glasswareChoices = [Glass(glassType: GlassType.Tulip)]
        
        super.ingredients = [Ingredient(ingredientType: IngredientType.Fruit)]
        super.ingredients?.append(Ingredient(ingredientType: IngredientType.Licorice))
        super.ingredients?.append(Ingredient(ingredientType: IngredientType.Hops))
    }
}