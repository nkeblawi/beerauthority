//
//  Pilsner.swift
//  BeerApp_beta
//
//  Created by Nabeel Keblawi on 9/21/15.
//  Copyright © 2015 Maliszewksi Enterprises, LLC. All rights reserved.
//

import Foundation

class Pilsner: Beer {
    init() {
        super.init(beerType: BeerType.Pilsner)
        super.recommendedUrlString = "http://www.ratebeer.com/beerstyles/pilsener/4/"
        
        super.glasswareChoices = [Glass(glassType: GlassType.Mug)]
        
        super.ingredients = [Ingredient(ingredientType: IngredientType.Hops)]
        
        super.beerDescription = "Lighter in color and body with a malty residual sweetness in aroma and flavor.  Slight grainy, corn-like sweetness from the use of maize with substantial offsetting hop bitterness. Rice-based versions are crisper, drier, and often lack corn-like flavors. Grassy, biscuit, and green apple flavor characteristics are common with pilsners. Alcohol content range between 4.5%-6%. The German and Bohemian-style pils are leaders in this style." + "\r\n"
    }
}