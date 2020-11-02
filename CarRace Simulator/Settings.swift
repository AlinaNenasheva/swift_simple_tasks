//
//  Settings.swift
//  CarRace Simulator
//
//  Created by Алина Ненашева on 10/25/20.
//  Copyright © 2020 Алина Ненашева. All rights reserved.
//

import Foundation

class Settings: Codable{
    var carColor: String
    var obstacle: String
    var racerName: String
     
    init(carColor: String = "blue", obstacle: String = "rock", racerName: String = "Unknown") {
        self.carColor = carColor
        self.obstacle = obstacle
        self.racerName = racerName
    }
}
