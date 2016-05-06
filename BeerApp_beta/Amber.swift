//
//  Amber.swift
//  BeerApp_beta
//
//  Created by Nabeel Keblawi on 9/21/15.
//  Copyright © 2015 Maliszewksi Enterprises, LLC. All rights reserved.
//

import Foundation

class Amber: Beer {
    init() {
        super.init(beerType: BeerType.Amber)
        super.recommendedUrlString = "http://www.ratebeer.com/beerstyles/amber-ale/53/"
        //super.recommendedUrlString = "http://www.beeradvocate.com/lists/style/128/"
        
        super.glasswareChoices = [Glass(glassType: GlassType.Pint)]
        super.glasswareChoices?.append(Glass(glassType: GlassType.Goblet))
        
        super.ingredients = [Ingredient(ingredientType: IngredientType.Hops)]
        
        super.beerDescription = "Amber to coppery-brown in color and usually clear, although dry-hopped versions may be slightly hazy. The malts may be sweet along with piney, caramel and nutty flavors. This style of beer, sometimes called \"Red Ales\" was created on the west coast of the United States and is now commonly found across the country. The alcohol content is usually between 4.5-6%. Nut Browns (or Brown Ales) offer very similar characteristics." + "\r\n"
    }
}