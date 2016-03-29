//
//  IPA.swift
//  BeerApp_beta
//
//  Created by Nabeel Keblawi on 9/21/15.
//  Copyright © 2015 Nabeel Keblawi. All rights reserved.
//

import Foundation

class IPA: Beer {
    init() {
        super.init(beerType: BeerType.IPA)
        super.recommendedUrlString = "http://www.ratebeer.com/beerstyles/india-pale-ale-ipa/17/"
        
        super.glasswareChoices = [Glass(glassType: GlassType.Pint)]
        
        super.ingredients = [Ingredient(ingredientType: IngredientType.Malt)]
        super.ingredients?.append(Ingredient(ingredientType: IngredientType.Hops))
    }
}