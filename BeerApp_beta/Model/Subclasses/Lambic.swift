//
//  Lambic.swift
//  BeerApp_beta
//
//  Created by Nabeel Keblawi on 9/21/15.
//  Copyright © 2015 Nabeel Keblawi. All rights reserved.
//

import Foundation

class Lambic: Beer {
    init() {
        super.init(beerType: BeerType.Lambic)
        super.recommendedUrlString = "http://www.ratebeer.com/beerstyles/lambic-style--faro/77/"
        
        super.glasswareChoices = [Glass(glassType: GlassType.Tulip)]
        
        super.ingredients = [Ingredient(ingredientType: IngredientType.Fruit)]
    }
}