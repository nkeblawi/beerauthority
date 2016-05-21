//
//  IPA.swift
//  BeerApp_beta
//
//  Created by Nabeel Keblawi on 9/21/15.
//  Copyright © 2015 Maliszewksi Enterprises, LLC. All rights reserved.
//

import Foundation

class IPA: Beer {
    init() {
        super.init(beerType: BeerType.IPA)
        super.recommendedUrlString = "http://www.ratebeer.com/beerstyles/india-pale-ale-ipa/17/"
        
        super.glasswareChoices = [Glass(glassType: GlassType.Pint)]
        
        super.ingredients = [Ingredient(ingredientType: IngredientType.Malt)]
        super.ingredients?.append(Ingredient(ingredientType: IngredientType.Hops))
        
        super.beerDescription = "During the 1700s, beer did not keep well on long ocean voyages, so the high hopping and alcohol of the India Pale Ale (IPA) solved this problem. Color is from golden amber to light copper, usually with an orange tint. Flavor characters are typically floral, piney or resinous, fruity and citrus-like. Malts are used to balance the hop bitterness. Alcohol content ranges from 5-7.6%. Imperial India Pale Ales (Double IPAs) are much higher in alcohol content and hop." + "\r\n"
    }
}