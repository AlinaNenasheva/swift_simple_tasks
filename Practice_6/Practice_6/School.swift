//
//  School.swift
//  Practice_6
//
//  Created by Алина Ненашева on 9/10/20.
//  Copyright © 2020 Алина Ненашева. All rights reserved.
//

import Foundation
class School{
    private let number: Int
    private let adress: String
    var students = [Student]()

    init(number: Int, adress: String = "", students: [Student] = []){
    self.number = number
    self.adress = adress
    self.students = students
    }
    func addStudent(student: Student){
        students.append(student)
    }
    
    func introduceStudebts(){
        for student in students{
            print(student.introduce())
        }
    }
}
