//
//  Ingredient.swift
//  BeerApp_beta
//
//  Created by Nabeel Keblawi on 9/21/15.
//  Copyright © 2015 Nabeel Keblawi. All rights reserved.
//

import Foundation

struct Ingredient {
    
    private let ingredientType: IngredientType
    private let ingredientName: String
    
    init(ingredientType: IngredientType) {
        self.ingredientType = ingredientType
        self.ingredientName = self.ingredientType.rawValue
    }
    
    func getImageFilename() -> String {
        return self.ingredientName    }
}