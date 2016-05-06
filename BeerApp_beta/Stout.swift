//
//  Stout.swift
//  BeerApp_beta
//
//  Created by Nabeel Keblawi on 9/21/15.
//  Copyright © 2015 Maliszewksi Enterprises, LLC. All rights reserved.
//

import Foundation

class Stout: Beer {
    init() {
        super.init(beerType: BeerType.Stout)
        super.recommendedUrlString = "http://www.ratebeer.com/beerstyles/stout/6/"
        
        super.glasswareChoices = [Glass(glassType: GlassType.Snifter)]
        
        super.ingredients = [Ingredient(ingredientType: IngredientType.Coffee)]
        super.ingredients?.append(Ingredient(ingredientType: IngredientType.Chocolate))
        
        super.beerDescription = "Generally dark brown to black in color. Stouts are originally an English style of beer that has become popular among American brewers. They are bold, dry roasted, coffee and chocolate-forward ales that sometimes integrate interesting flavors such as marshmallows. Stouts have a thick body and high head retention. Alcohol content is usually between 4.5-7.5%. Russian Imperial Stouts (these beers were brewed by England for export to Russia as they were popular with the imperial court there) are much higher in alcohol content and hop bitterness. Barrel-aged stouts also have become a phenomenon over the years." + "\r\n"
    }
}