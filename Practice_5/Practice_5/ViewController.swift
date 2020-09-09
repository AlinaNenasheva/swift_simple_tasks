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
    
    @IBOutlet weak var lightBeer: UIButton!
    
    @IBOutlet weak var fruitBeer: UIButton!
    
    @IBOutlet weak var countryOfOrigin: UITextField!
    
    @IBOutlet weak var priceText: UITextField!
    
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
        let beer = Beer(name: beerSort, price: beerPrice, countryOfOrigin: beerCountry)
        print ("Вы заказали \(beer.name) пиво из \("страны " + beer.countryOfOrigin) за \(beer.price) рублей")
    }
}

