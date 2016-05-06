//
//  BeerCharacteristics.swift
//  BeerApp_beta
//
//  Created by Nabeel Keblawi on 9/28/15.
//  Copyright © 2015 Maliszewksi Enterprises, LLC. All rights reserved.
//

import Foundation

struct BeerCharacteristics {
    
    private let appearance = "Note the beer's color, carbonation, head and its retention. Is the body clear or cloudy? Does the beer look lackluster and dull or bright and inviting? Does the carbonation look flat and less bubbly or is there a nice foam head with active bubbling?"
    
    private let smell = "Bring the beer to your nose. Note the beer's aromatic qualities. Malts: sweet, roasty, smoky, toasty, chocolaty, nutty, caramelly, biscuity. Hops: dank / resiny, herbal, spicy, grassy, floral, piney, citrusy. You might get fruity or flowery aromas (esters) from ales and very clean aromas from lagers, which will allow the malt and hop subtleties to pull through."
    
    private let taste = "Take a deep sip of the beer. Note any flavors, or interpretations of flavors, that you might discover. The descriptions should be similar to what you smell - is there a balance between the ingredients? Was the beer brewed with a specific dominance of character in mind? How does it fit the style?"
    
    private let mouthfeel = "Take another sip and let it wander. Note how the beer feels on the palate and its body - light, heavy, chewy, thin / watery, smooth or coarse? Was the beer flat and over-carbonated or was it balanced?"
    
    private let overall = "Your overall impression of the beer. Will you drink it again? If so, why? If not, why not?"
    
    private var EvaluationPoints: [String: String] = [:]
    
    init() {
        self.EvaluationPoints["Appearance"] = appearance
        self.EvaluationPoints["Smell"] = smell
        self.EvaluationPoints["Taste"] = taste
        self.EvaluationPoints["Mouthfeel"] = mouthfeel
        self.EvaluationPoints["Overall"] = overall
    }
    
    func getEvaluationPoints() -> [String: String] {
        return self.EvaluationPoints
    }
}