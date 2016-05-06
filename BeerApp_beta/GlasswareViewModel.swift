//
//  GlasswareViewModel.swift
//  BeerApp_beta
//
//  Created by Nabeel Keblawi on 9/27/15.
//  Copyright © 2015 Maliszewksi Enterprises, LLC. All rights reserved.
//

import Foundation
import UIKit

class GlasswareViewModel {
    
    private let glasses: [Glass]
    
    init() {
        glasses = [
            Glass(glassType: GlassType.Goblet),
            Glass(glassType: GlassType.Mug),
            Glass(glassType: GlassType.Pint),
            Glass(glassType: GlassType.Snifter),
            Glass(glassType: GlassType.Tulip),
            Glass(glassType: GlassType.Weizen),
        ]
    }
    
    func getCount() -> Int {
        return glasses.count
    }
    
    func getName(itemIndex: Int) -> String {
        return glasses[itemIndex].getName()
    }
    
    func getDescription(itemIndex: Int) -> String {
        return glasses[itemIndex].getDescription()
    }
}