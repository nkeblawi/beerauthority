//
//  Barleywine.swift
//  BeerApp_beta
//
//  Created by Nabeel Keblawi on 9/21/15.
//  Copyright © 2015 Maliszewksi Enterprises, LLC. All rights reserved.
//

import Foundation

class Barleywine: Beer {
    init() {
        super.init(beerType: BeerType.Barleywine)
        super.recommendedUrlString = "http://www.ratebeer.com/beerstyles/barley-wine/11/"
        
        super.glasswareChoices = [Glass(glassType: GlassType.Snifter)]
        
        super.ingredients = [Ingredient(ingredientType: IngredientType.Pumpkin)]
        super.ingredients?.append(Ingredient(ingredientType: IngredientType.Malt))
        
        super.beerDescription = "Barleywines have strong and complex malt biscuit-like flavors such as nuts, raisins and toffee. Moderate to fairly high fruitiness, often with a dried and dark fruit character. Hop bitterness may range from just enough for balance to a firm presence. Barleywines are often associated for special occasions and great aging candidates just like wine. Alcohol content tends to be 8% or higher." + "\r\n"
    }
}