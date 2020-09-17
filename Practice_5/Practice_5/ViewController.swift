//
//  ViewController.swift
//  Practice_5
//
//  Created by Алина Ненашева on 9/7/20.
//  Copyright © 2020 Алина Ненашева. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    // MARK:- IBOutlets
    
    
    @IBOutlet weak var darkBeerButton: UIButton!
    @IBOutlet weak var lightBeerButton: UIButton!
    @IBOutlet weak var fruitBeerButton: UIButton!
    @IBOutlet weak var countryOfOriginText: UITextField!
    @IBOutlet weak var priceText: UITextField!
    @IBOutlet weak var countProfitButton: UIButton!
    
    // MARK:- Var
    
    
    var beerSort = ""
    var beerPrice = 0
    var beerCountry = "unknown country"
    
    // MARK:- Lifecycle functions
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK:- Flow functions
    
    @IBAction func darkBeerButtonSelected(_ sender: Any){
        beerSort = "dark"
        fruitBeerButton.isSelected = false
        lightBeerButton.isSelected = false
        darkBeerButton.isSelected = true
    }
    
    @IBAction func lightBeerButtonSelected(_ sender: Any) {
        beerSort = "light"
        fruitBeerButton.isSelected = false
        lightBeerButton.isSelected = true
        darkBeerButton.isSelected = false
    }
    
    @IBAction func fruitBeerButtonSelected(_ sender: Any) {
        beerSort = "fruit"
        fruitBeerButton.isSelected = true
        lightBeerButton.isSelected = false
        darkBeerButton.isSelected = false
    }
        
    @IBAction func priceTextEditingChanged(_ sender: Any) {
        let text: String = priceText.text ?? ""
        beerPrice = Int(text) != nil ? Int(text)! : 0
    }
    
    @IBAction func countryOfOriginTextDidChange(_ sender: Any) {
                beerCountry = countryOfOriginText.text ?? ""
    }
    
    @IBAction func buttonDrinkBeerPressed(_ sender: Any) {
        let beer = Beer(name: beerSort, price: beerPrice, countryOfOrigin: beerCountry, leftBeerCups: 10)
        BeerManager.shared.orderBeer(beer: beer)
        if beer.name == "" {
            print("You must choose sort!")
        } else {
            print("You drunk \(beer.name) beer from \(beer.countryOfOrigin) for \(beer.price) dollar(s)")
            
        }
    }
    
    @IBAction func buttonCountProfitPressed(_ sender: Any) {
        BeerManager.shared.countProfit()
    }
}

