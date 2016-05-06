//
//  CellaringTips.swift
//  BeerApp_beta
//
//  Created by Nabeel Keblawi on 9/30/15.
//  Copyright © 2015 Maliszewksi Enterprises, LLC. All rights reserved.
//

import Foundation

struct CellaringTips {
    
    private let tip_part1: String = "If you are buying beers specifically for cellaring (aging) purposes, opt for brews that are high in alcohol (at least 8% ABV) and malt, and low in hops, as  bittering compounds break down over time."
        + "\r\n" + "\r\n"
        + "If you do wish to store hoppy beers like IPAs, keep them refrigerated as cold storage prevents hop oil spoilage."
        + "\r\n" + "\r\n"
        + "Watch for these beer label buzzwords when selecting cellar candidates:"
    
    private let bulletPoints: String = " • Bottle-conditioned:  Bottle-conditioned beers contain active yeast that will ferment the beer as long as you store it, lending the beer new flavors and complexities as it ages."
        + "\r\n" + "\r\n"
        + " • Reserve:  Brewers’ special “reserve series” beers are rare releases (usually anniversary brews) often intended to be aged."
        + "\r\n" + "\r\n"
        + " • Brettanomyces:  Also known as sours. This Belgian yeast often added to beer near its bottling, needs months to develop its unique flavor."
        + "\r\n" + "\r\n"
        + " • Vertical:  This word on a beer label means the brewer wants you to buy now, enjoy later. These beers are released annually and meant to be collected over time to form a “vertical collection” of the same brew."
        + "\r\n" + "\r\n"
        + " • Barrel-aged: These are very popular beer styles that are aged in wood (typically whiskey barrels) usually contain big flavors that develop nicely with time."
    
    private let tip_part2: String = "Pay attention to labels—some recommend aging, while others offer expiration dates—but more than anything, experiment. Beer cellaring is a relatively new hobby, and sometimes, it pays to age a questionable beer. Don’t forget to note the date you purchased the beer."
        + "\r\n" + "\r\n"
        + "If you can, purchase in multiples preferably in threes - drink one immediately, one in two years, and one in five years. Take notes each time, and compare them to determine the beer’s optimal aging period."
        + "\r\n" + "\r\n"
        + "Beer needs three perfect conditions to age properly: darkness, coolness and consistency. Always keep light away from beer; light (from the sun or a light bulb) reacts with acids within beer, and the result is a “skunky” or sulfuric taste and smell. Keep your aging brew somewhere dark."
        + "\r\n" + "\r\n"
        + "Beer should also mature in a cool space, but not your refrigerator (other than IPAs) —ideally, a spot between 50 and 55 degrees Fahrenheit, the standard temperature for cellaring."
        + "\r\n" + "\r\n"
        + "The stand-it-up or lay-it-down debate has been heated for decades. Vertical storage is the best method: First, cork may impose undesirable musty, “corky” flavors in beer; standing beer upright eliminates that risk, and likely, there’s enough humidity inside the bottle to keep the cork from drying out. Second, when beer is stored horizontally, any sediment in the beer spreads out, and may cause a ring of yeast inside the bottle that doesn’t settle; storing beer vertically forces sediment to sink to the bottom of the bottle, which means it is less likely to end up in your glass."
        + "\r\n" + "\r\n"
        + "Brewers and beer drinkers usually determine aging times by trial and error. Always remember that aging doesn’t generally create new flavors, it simply allows some flavors to fade in order to let other beer characteristics to develop and become more prominent over time."
    
    private var tip: String
    
    init() {
        tip = tip_part1 + "\r\n \r\n" + bulletPoints  + "\r\n \r\n" + tip_part2
    }
    
    func getCellaringTips() -> String {
        return self.tip
    }
}