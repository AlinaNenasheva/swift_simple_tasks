//
//  BeerManager.swift
//  Practice_5
//
//  Created by Алина Ненашева on 9/13/20.
//  Copyright © 2020 Алина Ненашева. All rights reserved.
//

import Foundation

class BeerManager{
    static let shared = BeerManager()
    private var profit = 0
    private let darkBeer = Beer(name: "темное", price: 0, countryOfOrigin: "", leftBeerCups: 10)
    private let lightBeer:Beer = Beer(name: "светлое", price: 0, countryOfOrigin: "", leftBeerCups: 10)
    private let fruitBeer:Beer = Beer(name: "фруктовое", price: 0, countryOfOrigin: "", leftBeerCups: 10)
    private init() {}
    
    func orderBeer(beer: Beer, type: Int){
        if fruitBeer.leftBeerCups != 0 && type == 1{
            fruitBeer.leftBeerCups -= 1
            profit += beer.price
        }else if darkBeer.leftBeerCups != 0 && type == 2{
            darkBeer.leftBeerCups -= 1
            profit += beer.price
        }
        else if lightBeer.leftBeerCups != 0 && type == 3{
            lightBeer.leftBeerCups -= 1
            profit += beer.price
        }
        else{
            print("Oops, this beer is currently out of stock")
        }
    }
    
    func countProfit(){
        print("There are \(darkBeer.leftBeerCups) dark beer cups, \(lightBeer.leftBeerCups) light beer cups and \(fruitBeer.leftBeerCups) fruit beer cups.")
        darkBeer.leftBeerCups = 10
        lightBeer.leftBeerCups = 10
        fruitBeer.leftBeerCups = 10
        print("Total profit is \(profit)")
        profit = 0
    }
    
}
