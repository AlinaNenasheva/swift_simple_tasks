//
//  Beer.swift
//  Practice_5
//
//  Created by Алина Ненашева on 9/8/20.
//  Copyright © 2020 Алина Ненашева. All rights reserved.
//

import Foundation

class Beer{
    var name: String
    var price: Int
    var countryOfOrigin: String
    
    init(name: String, price: Int, countryOfOrigin: String){
        self.name = name
        self.price = price
        self.countryOfOrigin = countryOfOrigin
    }
}
