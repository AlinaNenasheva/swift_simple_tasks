//
//  ViewController.swift
//  Practice_5
//
//  Created by Алина Ненашева on 9/7/20.
//  Copyright © 2020 Алина Ненашева. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    @IBOutlet weak var darkBeerButton: UIButton!
    
    @IBOutlet weak var lightBeerButton: UIButton!
    
    @IBOutlet weak var fruitBeerButton: UIButton!
    
    @IBOutlet weak var countryOfOriginText: UITextField!
    
    @IBOutlet weak var priceText: UITextField!
    
    @IBOutlet weak var countProfitButton: UIButton!
    
    var beerSort = ""
    var beerPrice = 0
    var beerCountry = "неизвестной страны"
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func darkBeerButtonSelected(_ sender: Any){
        beerSort = "темное"
        fruitBeerButton.isSelected = false
        lightBeerButton.isSelected = false
        darkBeerButton.isSelected = true
    }
    
    @IBAction func lightBeerButtonSelected(_ sender: Any) {
        beerSort = "светлое"
        fruitBeerButton.isSelected = false
        lightBeerButton.isSelected = true
        darkBeerButton.isSelected = false
    }
    
    @IBAction func fruitBeerButtonSelected(_ sender: Any) {
        beerSort = "фруктовое"
        fruitBeerButton.isSelected = true
        lightBeerButton.isSelected = false
        darkBeerButton.isSelected = false
    }
    
    @IBAction func priceTextDidChange(_ sender: Any) {
        let text: String = priceText.text ?? ""
        beerPrice = Int(text) != nil ? Int(text)! : 0
    }
    
    @IBAction func countryOfOriginTextFieldDidChange
(_ sender: Any) {
        
        beerCountry = countryOfOriginText.text ?? ""
    }
    
    @IBAction func buttonDrinkBeerPressed(_ sender: Any) {
        let beer = Beer(name: beerSort, price: beerPrice, countryOfOrigin: beerCountry, leftBeerCups: 10)
        BeerManager.shared.orderBeer(beer: beer)
        print("Вы выпили \(beer.name) пиво из \(beer.countryOfOrigin) за \(beer.price)")
    }
    
    @IBAction func buttonCountProfitPressed(_ sender: Any) {
        BeerManager.shared.countProfit()
    }
}

