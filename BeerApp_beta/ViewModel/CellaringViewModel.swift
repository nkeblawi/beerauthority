//
//  CellaringViewModel.swift
//  BeerApp_beta
//
//  Created by Nabeel Keblawi on 9/30/15.
//  Copyright © 2015 Nabeel Keblawi. All rights reserved.
//

import Foundation

class CellaringViewModel {
    
    private let cellaringTips: CellaringTips
    
    init() {
        self.cellaringTips = CellaringTips()
    }
    
    func getCellaringTips() -> String {
        return cellaringTips.getCellaringTips()
    }
}