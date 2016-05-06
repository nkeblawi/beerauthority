//
//  Glass.swift
//  BeerApp_beta
//
//  Created by Nabeel Keblawi on 9/21/15.
//  Copyright © 2015 Maliszewksi Enterprises, LLC. All rights reserved.
//

import Foundation

struct Glass {
    
    private let glassType: GlassType
    private let glassName: String
    
    init(glassType: GlassType) {
        self.glassType = glassType
        self.glassName = self.glassType.rawValue
    }
    
    func getName() -> String {
        return self.glassName
    }
    
    func getDescription() -> String {
        switch glassType {
        case GlassType.Snifter:
            return "A beer connoisseur favorite. These wide-bowled and stemmed glasses with their tapered mouths allow for capturing the aromas of brews. They provide room to swirl and agitate. Popular for barleywines, dark ales, stouts, and those strong double imperial beers."
        case GlassType.Pint:
            return "Standard of all beers. There are two standard sizes - the 16-ounce or the 20-ounce. Easy to handle, store, and drink out of. A crowd favorite for IPA and lager style beers, but still popular almost any kind of beer."
        case GlassType.Tulip:
            return "A stemmed glass with a top that forms a lip to capture the true essence of brew heads. The body is bulbous, and it captures and enhances volatiles that induce and support large foamy heads. Popular for the double imperial IPAs, Belgians, and sours."
        case GlassType.Goblet:
            return "Typically thick and heavy. These majestic pieces of work creates a CO2 nucleation point and a stream of eternal bubbles occur providing a beautiful foam head. Popular for the darker Belgian beers."
        case GlassType.Mug:
            return "These come in various sizes and typically heavy, large, and sturdy along with a handle. Seidel is a German mug while a Stein is the stone equivalent that traditionally features a lid.  Also available in dimpled mugs. Popular for all types of beers."
        case GlassType.Weizen:
            return "These classy tall glasses with their thin walls showcase the beer’s color and allows for much headspace to contain the fluffy heads. Most are 0.5L in size with slight variations in style. Popular for wheats especially Hefeweizens."
        }
    }
}