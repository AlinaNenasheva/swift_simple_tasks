//
//  Student.swift
//  Practice_6
//
//  Created by Алина Ненашева on 9/10/20.
//  Copyright © 2020 Алина Ненашева. All rights reserved.
//

import Foundation
class Student{
    var name: String
    var age: Int
    
    init(name: String, age: Int = 18){
        self.name = name
        self.age = age
    }
    
    func introduce()-> String{
        return "My name is \(name). I'm \(age) y.o."
    }
}
