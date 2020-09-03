//
//  ViewController.swift
//  Practice_4
//
//  Created by Алина Ненашева on 9/3/20.
//  Copyright © 2020 Алина Ненашева. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let names = ["Vlad", "Anna", "Maksim"]
    let numbers = [32, 33, 43]
    override func viewDidLoad() {
        super.viewDidLoad()
        typealias tuplesArray = [(Int, String)]
        let array: tuplesArray = [(4, "f"), (2, "g"), (7, "j")]
        let arrayInSquare = array.map({($0.0 * $0.0, $0.1)})
        let filtratedArrayInSquare = arrayInSquare.filter({$0.0 % 2 == 0})
        let sortedFiltratedArrayInSquare = filtratedArrayInSquare.sorted(by: { $0.1 < $1.1})
        print(sortedFiltratedArrayInSquare)
   
        //        print(arrayInSquare)
//        print(array)
//        let filteredTuplesArrayInSquare = array.map({_ in (first: Int, second: String)->(Int, String)
//            var tuplesVar: tuplesArray
//            tuplesVar.first = first * first
//            tuplesVar.second = second
//            return tuplesVar})
//        print(filteredTuplesArrayInSquare)
//        let sortedFilteredTuplesArrayInSquare = filteredTuplesArrayInSquare.sorted(by: {$0.second < $1.second})

//        let rooms: [Int] = [24, 34, 32, 43]
//        let index = 5
//        for room in rooms{
//            print(room)
//        }
//        if index < rooms.count{
//            let one = rooms[index]
//        }else{
//            print("Invalid index")
//        }
//        let rooms2 = [Int]()
//        let strings = ["Alina", "Maksim", "Ivan"]
//        for string in strings{
//            print(string)
//        }
//        let newNames = names.map({"\($0) 1"})
//        print(newNames)
//        let filteredNumbers = numbers.filter({$0 > 40})
//
//        let sortedNumbers = numbers.sorted(by: { $0 < $1})
//        let persons: [(name: String, age: Int)] = [("Vlad", 22), ("Anna", 23), ( "Maksim", 24)]
//        for person in persons{
//            print("\(person.name) \(person.age)")
//        }
//
//        let personsSortedByAge = persons.sorted(by: {$0.age < $1.age})
//        print(personsSortedByAge)
    }

 
    


}

