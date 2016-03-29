//
//  BrewingProcess.swift
//  BeerApp_beta
//
//  Created by Nabeel Keblawi on 11/1/15.
//  Copyright © 2015 Nabeel Keblawi. All rights reserved.
//

import Foundation

struct BrewingProcess {
    
    private let ingredients = "Beer is made from four basic ingredients: barley, water, hops and yeast. The basic idea is to extract the sugars from grains (usually barley) so that the yeast can turn it into alcohol and CO2, thus creating beer."
    
    private let malting = "The brewing process starts with grains, usually barley (sometimes wheat or rye). The grains are harvested and processed through a process of heating, drying out and cracking. The main goal of malting is to isolate the enzymes needed for brewing so that it’s ready for the next step."
    
    private let mashing = "The grains then go through a process known as mashing, in which they are steeped in hot, but not boiling, water sort of like making tea. This activates enzymes in the grains that cause it to break down and release its sugars. Once this is all done water is drained out from the mash which is now full of sugar from the grains. This sticky, sweet liquid is called wort. It’s basically unmade beer, sort of like how dough is unmade bread."
    
    private let boiling = "The wort is boiled while hops and other spices are added several times. Hops are the small, green cone-like fruit of a vine plant. They provide bitterness to balance out all the sugar in the wort (malt) and provide flavor. They also act as a natural preservative, which is what they were first used for."
    
    private let fermentation = "Once the hour long boil is over the wort is cooled, strained and filtered. It’s then put in a fermenting vessel and yeast is added to it. At this point the brewing is complete and the fermentation begins. The beer is stored a few weeks at room temperature (in the case of ales) or longer at cold temperatures (in the case of lagers) while the yeast works its fermentation magic. Basically, the yeast eats up all that sugar in the wort and spits out CO2 and alcohol as waste products."
    
    private let bottling = "Beer at this point may still be flat and uncarbonated. The flat beer is bottled, at which time it is either artificially carbonated like a soda, or if it’s going to be ‘bottle conditioned’ it’s allowed to naturally carbonate via the CO2 the yeast produces. After allowing it to age for anywhere from a few weeks to a few months, the beer is ready to be enjoyed!"
    
    private var steps: [BrewSteps: String] = [:]
    
    init() {
        self.steps[BrewSteps.Ingredients] = ingredients
        self.steps[BrewSteps.Malting] = malting
        self.steps[BrewSteps.Mashing] = mashing
        self.steps[BrewSteps.Boiling] = boiling
        self.steps[BrewSteps.Fermentation] = fermentation
        self.steps[BrewSteps.Bottling] = bottling
    }
    
    func getBrewingInstructions() -> [BrewSteps: String] {
        return self.steps
    }
    
}