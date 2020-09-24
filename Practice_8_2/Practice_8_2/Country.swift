//
//  Country.swift
//  Practice_8_2
//
//  Created by Алина Ненашева on 9/24/20.
//  Copyright © 2020 Алина Ненашева. All rights reserved.
//

import Foundation

class Country{
    var name: String
    var area: Double
    var timeZone: Int
    
    init (name: String = "", area: Double = 0.0, timeZone: Int = 0){
        self.name = name
        self.area = area
        self.timeZone = timeZone
    }
}
