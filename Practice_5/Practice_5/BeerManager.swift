//
//  BeerManager.swift
//  Practice_5
//
//  Created by Алина Ненашева on 9/13/20.
//  Copyright © 2020 Алина Ненашева. All rights reserved.
//

import Foundation

class BeerManager {
    static let shared = BeerManager()
    private var profit = 0
    private let darkBeer = Beer(name: "dark", price: 0, countryOfOrigin: "", leftBeerCups: 10)
    private let lightBeer:Beer = Beer(name: "light", price: 0, countryOfOrigin: "", leftBeerCups: 10)
    private let fruitBeer:Beer = Beer(name: "fruit", price: 0, countryOfOrigin: "", leftBeerCups: 10)
    
    private init() {
    }
    
    func orderBeer(beer: Beer) {
        if fruitBeer.leftBeerCups != 0 && beer.name == "fruit" {
            fruitBeer.leftBeerCups -= 1
            profit += beer.price
            notificationMade(beer: beer)
        } else if darkBeer.leftBeerCups != 0 && beer.name == "dark" {
            darkBeer.leftBeerCups -= 1
            profit += beer.price
            notificationMade(beer: beer)
        }
        else if lightBeer.leftBeerCups != 0 && beer.name == "light" {
            lightBeer.leftBeerCups -= 1
            profit += beer.price
            notificationMade(beer: beer)
        } else {
            print("Oops, this beer is currently out of stock")
        }
    }
    
    func notificationMade(beer: Beer) {
        print("You drunk \(beer.name) beer from \(beer.countryOfOrigin) for \(beer.price) dollar(s)")
    }
    
    func countProfit() {
        print("There are \(darkBeer.leftBeerCups) dark beer cups, \(lightBeer.leftBeerCups) light beer cups and \(fruitBeer.leftBeerCups) fruit beer cups.")
        darkBeer.leftBeerCups = 10
        lightBeer.leftBeerCups = 10
        fruitBeer.leftBeerCups = 10
        print("Total profit is \(profit)")
        profit = 0
    }
    
}
