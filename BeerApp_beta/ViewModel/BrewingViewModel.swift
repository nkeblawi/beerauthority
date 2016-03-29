//
//  BrewingViewModel.swift
//  BeerApp_beta
//
//  Created by Nabeel Keblawi on 11/1/15.
//  Copyright © 2015 Nabeel Keblawi. All rights reserved.
//

import Foundation
import UIKit

class BrewingViewModel {
    
    private let brewingInstructions: BrewingProcess
    
    init() {
        self.brewingInstructions = BrewingProcess()
    }
    
    func getCount() -> Int {
        return brewingInstructions.getBrewingInstructions().count
    }
    
    func getKey(index: Int) -> BrewSteps {
        switch index {
        case 0: return BrewSteps.Ingredients
        case 1: return BrewSteps.Malting
        case 2: return BrewSteps.Mashing
        case 3: return BrewSteps.Boiling
        case 4: return BrewSteps.Fermentation
        case 5: return BrewSteps.Bottling
        default: return BrewSteps.Ingredients
        }
    }
    
    func getDescriptionValueFromKey(key: BrewSteps) -> String {
        let dict = brewingInstructions.getBrewingInstructions()
        return dict[key]!
    }
}