//
//  Sour.swift
//  BeerApp_beta
//
//  Created by Nabeel Keblawi on 9/21/15.
//  Copyright © 2015 Maliszewksi Enterprises, LLC. All rights reserved.
//

import Foundation

class Sour: Beer {
    init() {
        super.init(beerType: BeerType.Sour)
        super.recommendedUrlString = "http://www.ratebeer.com/beerstyles/sour-wild-ale/52/"
        //super.recommendedUrlString = "http://www.ratebeer.com/beerstyles/lambic-style--gueuze/73/"
        
        super.glasswareChoices = [Glass(glassType: GlassType.Tulip)]
        
        super.ingredients = [Ingredient(ingredientType: IngredientType.Fruit)]
        super.ingredients?.append(Ingredient(ingredientType: IngredientType.Licorice))
        super.ingredients?.append(Ingredient(ingredientType: IngredientType.Hops))
        
        super.beerDescription = "Pours in various colors ranging from light gold to hazy red. Common flavors include plums, strawberries, raisins, black currants, and hints of balsamic vinegar. The acidity present in these beers is usually in the form of lactic, acetic and other organic acids naturally developed with acidified malt in the mash, or produced during fermentation by the use of various microorganisms. These beers may derive their sour flavor from pure cultured forms of souring agents or from the influence of barrel aging. Typical alcohol content varies anywhere from 5-9%. This style has become increasingly popular in recent years." + "\r\n"
    }
}