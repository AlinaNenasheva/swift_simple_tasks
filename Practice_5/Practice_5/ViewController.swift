//
//  ViewController.swift
//  Practice_5
//
//  Created by Алина Ненашева on 9/7/20.
//  Copyright © 2020 Алина Ненашева. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    @IBOutlet weak var darkBeer: UIButton!
    @IBOutlet weak var beerImage: UIImageView!
    
    @IBOutlet weak var lightBeer: UIButton!
    
    @IBOutlet weak var fruitBeer: UIButton!
    
    @IBOutlet weak var countryOfOrigin: UITextField!
    
    @IBOutlet weak var priceText: UITextField!
    
    @IBOutlet weak var countButton: UIButton!
    
    var beerSort = ""
    var beerPrice = 0
    var beerCountry = "неизвестной страны"
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func getDarkBeer(_ sender: Any){
        beerSort = "темное"
    }
    
    @IBAction func getLightBeer(_ sender: Any) {
        beerSort = "светлое"
    }
    
    @IBAction func getFruitBeer(_ sender: Any) {
        beerSort = "фруктовое"
    }
    
    @IBAction func getPrice(_ sender: Any) {
        let text: String = priceText.text ?? ""
        beerPrice = Int(text) != nil ? Int(text)! : 0
    }
    
    @IBAction func getCountryOfOrigin(_ sender: Any) {
        
        beerCountry = countryOfOrigin.text ?? ""
    }
    
    @IBAction func getDrunk(_ sender: Any) {
        let beer = Beer(name: beerSort, price: beerPrice, countryOfOrigin: beerCountry, leftBeerCups: 10)
        if beer.name == "фруктовое"{
            BeerManager.shared.orderBeer(beer: beer, type: 1)
        }else if beer.name == "темное"{
            BeerManager.shared.orderBeer(beer: beer, type: 2)
        }else{
            BeerManager.shared.orderBeer(beer: beer, type: 3)
        }
        
    }
    
    @IBAction func countProfit(_ sender: Any) {
        BeerManager.shared.countProfit()
    }
}

