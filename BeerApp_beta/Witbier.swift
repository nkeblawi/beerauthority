//
//  Witbier.swift
//  BeerApp_beta
//
//  Created by Nabeel Keblawi on 9/21/15.
//  Copyright © 2015 Maliszewksi Enterprises, LLC. All rights reserved.
//

import Foundation

class Witbier: Beer {
    init() {
        super.init(beerType: BeerType.Witbier)
        //super.recommendedUrlString = "http://www.ratebeer.com/beerstyles/witbier/48/"
        super.recommendedUrlString = "http://www.ratebeer.com/beerstyles/german-hefeweizen/7/"
        
        super.glasswareChoices = [Glass(glassType: GlassType.Weizen)]
        
        super.ingredients = [Ingredient(ingredientType: IngredientType.Wheat)]
        
        super.beerDescription = "Hefe means \"yeast\" and weizen means \"wheat\". A Hefeweizen is an unfiltered German wheat beer that is pale straw to dark gold in color. These beers are cloudy because of the yeast and the high protein content of the wheat due to not being filtered. Hefeweizens have banana and clove esters that come from special yeast. They could have a bubblegum flavor. These beers are medium bodied with high carbonation. Alcohol is usually between 4.5-6.2%. American Wheat and Belgian Witbiers are also popular similar tasting beers." + "\r\n"
    }
}