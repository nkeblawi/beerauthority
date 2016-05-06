//
//  Belgian.swift
//  BeerApp_beta
//
//  Created by Nabeel Keblawi on 9/21/15.
//  Copyright © 2015 Maliszewksi Enterprises, LLC. All rights reserved.
//

import Foundation

class Belgian: Beer {
    init() {
        super.init(beerType: BeerType.Belgian)
        //super.recommendedUrlString = "http://www.ratebeer.com/beerstyles/belgian-ale/12/"
        //super.recommendedUrlString = "http://www.ratebeer.com/beerstyles/belgian-strong-ale/13/"
        super.recommendedUrlString = "http://www.ratebeer.com/beerstyles/abbey-tripel/72/"
        
        super.glasswareChoices = [Glass(glassType: GlassType.Goblet)]
        
        super.ingredients = [Ingredient(ingredientType: IngredientType.Pumpkin)]
        super.ingredients?.append(Ingredient(ingredientType: IngredientType.Malt))
        super.ingredients?.append(Ingredient(ingredientType: IngredientType.Hops))
        
        super.beerDescription = "It is believed that Tripels were invented at a monastery in Westmalle, Belgium which still brews to this day. They are yellow to deep gold in color and are often highly carbonated almost like champagne. Typically complex in flavor consisting of citrus fruits, Belgian candi sugar, and various spices. Alcohol ranges from 7-10+%. Belgian-style strong ales are similar but generally darker and have more noticeable malt sweetness." + "\r\n"
    }
}