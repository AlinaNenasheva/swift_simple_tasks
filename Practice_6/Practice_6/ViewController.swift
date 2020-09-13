//
//  ViewController.swift
//  Practice_6
//
//  Created by Алина Ненашева on 9/10/20.
//  Copyright © 2020 Алина Ненашева. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let school = School(number: 44)
    let student = Student(name: "Vlad")
    let studentWithAge = Student(name: "Kostya", age: 22)
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        print(student.introduce())
//        print(studentWithAge.introduce())
        school.students.append(contentsOf: [student, studentWithAge])
        let students = school.students
        school.students.append(contentsOf: [student, studentWithAge])
        if students.isEmpty == false{
            for student in school.students{
                print(student.introduce())
            }
        }
        let firstAdress = Adress(street: "Жиновича", home: 1, flat: 139)
        let firstPatient = Patient(name: "Alina", birthday: "17.07.01", diagnosis: "чичя", adress: firstAdress)
        let secondAdress = Adress(street: "Гаруна", home: 23, flat: 43)
        let secondPatient = Patient(name: "Vlad", birthday: "13.02.98", diagnosis: "рак", adress: secondAdress)
        print ("My home num is \(firstPatient.adress.home)")
        school.addStudent(student: studentWithAge)
        school.introduceStudebts()
        DatabaseManager.shared.connected()
    }


}

