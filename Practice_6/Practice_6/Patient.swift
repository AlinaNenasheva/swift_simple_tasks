//
//  Patient.swift
//  Practice_6
//
//  Created by Алина Ненашева on 9/10/20.
//  Copyright © 2020 Алина Ненашева. All rights reserved.
//

import Foundation
class Patient{
    let name: String
    let birthday: String
    let diagnosis: String
    let adress: Adress
    
    init(name: String, birthday: String, diagnosis: String, adress: Adress) {
        self.name = name
        self.birthday = birthday
        self.diagnosis = diagnosis
        self.adress = adress
    }
}

