//
//  EvaluationViewModel.swift
//  BeerApp_beta
//
//  Created by Nabeel Keblawi on 9/28/15.
//  Copyright © 2015 Maliszewksi Enterprises, LLC. All rights reserved.
//

import Foundation
import UIKit

class EvaluationViewModel {
    
    private let beerCharacteristics: BeerCharacteristics
    
    init() {
        self.beerCharacteristics = BeerCharacteristics()
    }
    
    func getCount() -> Int {
        return beerCharacteristics.getEvaluationPoints().count
    }
    
    func getKey(index: Int) -> String {
        switch index {
        case 0: return "Appearance"
        case 1: return "Smell"
        case 2: return "Taste"
        case 3: return "Mouthfeel"
        default: return "Overall"
        }
    }
    
    func getDescriptionValueFromKey(key: String) -> String? {
        let dict = beerCharacteristics.getEvaluationPoints()
        return dict[key]
    }
}