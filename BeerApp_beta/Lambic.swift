//
//  Lambic.swift
//  BeerApp_beta
//
//  Created by Nabeel Keblawi on 9/21/15.
//  Copyright © 2015 Maliszewksi Enterprises, LLC. All rights reserved.
//

import Foundation

class Lambic: Beer {
    init() {
        super.init(beerType: BeerType.Lambic)
        //super.recommendedUrlString = "http://www.ratebeer.com/beerstyles/lambic-style--faro/77/"
        super.recommendedUrlString = "http://www.ratebeer.com/beerstyles/lambic-style--fruit/14/"
        
        super.glasswareChoices = [Glass(glassType: GlassType.Tulip)]
        
        super.ingredients = [Ingredient(ingredientType: IngredientType.Fruit)]
        
        super.beerDescription = "Appearances of this style vary between golden, orange, and deep red. Often known as cassis, framboise, kriek, or peche, a fruit lambic takes on the color and flavor of the fruit it is brewed with. Raspberries, plums, toffee, cherries, rose petals and red wine are common flavor characteristics. Notes of Brettanomyces yeast might be present at varied levels as sourness can be an important part of the flavor profile. Alcohol content of these styles is typically between 4-6%. Some might classify this style as a Fruit beer, which seem to be popular among those who do not like traditional beer flavors." + "\r\n"
    }
}