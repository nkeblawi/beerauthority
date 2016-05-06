//
//  Porter.swift
//  BeerApp_beta
//
//  Created by Nabeel Keblawi on 9/21/15.
//  Copyright © 2015 Maliszewksi Enterprises, LLC. All rights reserved.
//

import Foundation

class Porter: Beer {
    init() {
        super.init(beerType: BeerType.Porter)
        super.recommendedUrlString = "http://www.ratebeer.com/beerstyles/porter/5/"
        
        super.glasswareChoices = [Glass(glassType: GlassType.Snifter)]
        
        super.ingredients = [Ingredient(ingredientType: IngredientType.Coffee)]
        super.ingredients?.append(Ingredient(ingredientType: IngredientType.Licorice))
        
        super.beerDescription = "Light to dark brown in color, often with a ruby tint. The flavor has a moderate roasted malt taste that usually includes milk chocolate, oatmeal, coffee or licorice flavors. Hop flavor is usually non-existent although some bittering is used for balance. Porters are similar to brown ales, but are thicker and have more of a roasted flavor. The alcohol content is usually in the 4-7% range. A popular style for this beer are Baltic Porters (originates from countries in the Baltic Sea area) which are higher in alcohol content and richer in mouthfeel." + "\r\n"
    }
}