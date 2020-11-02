//
//  Settings.swift
//  CarRace Simulator
//
//  Created by Алина Ненашева on 10/23/20.
//  Copyright © 2020 Алина Ненашева. All rights reserved.
//

import Foundation

class Settings: Encodable{
    enum CarColor {
        case brown
        case green
        case blue
    }
    
    enum Obstacle {
        case rock
        case grass
        case log
    }
    var carColor: CarColor
    var obstacle: Obstacle
    var racerName: String
     
    init(carColor: CarColor = .blue, obstacle: Obstacle = .rock, racerName: String = "Unknown") {
        self.carColor = carColor
        self.obstacle = obstacle
        self.racerName = racerName
    }
}
