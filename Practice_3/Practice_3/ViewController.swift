//
//  ViewController.swift
//  Practice_3
//
//  Created by Алина Ненашева on 8/31/20.
//  Copyright © 2020 Алина Ненашева. All rights reserved.

import UIKit

class ViewController: UIViewController {
    var sum = 0
    var factorial = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sumUp(23.4, 32.4)
        sumUp(23, 32)
        subtract(23.4, 32.4)
        subtract(23, 32)
        multiply(23.4, 32.4)
        multiply(23, 32)
        divide(23.4, 32.4)
        divide(23, 34)
        countFourDigitNumber(value: 4441)
        compriseStrings("Alina", "Tatyana")
  //      breakProgram(value: 1)
        calculatePower(2)
        calculatePower(2, to: 5)
        calculateFactorial(4)
        
    }
    
    func sumUp(_ firstValue: Int, _ secondValue: Int){
        print("\(firstValue) + \(secondValue) = \(firstValue + secondValue)")
    }
    
    func sumUp(_ firstValue: Double, _ secondValue: Double){
        print("\(firstValue) + \(secondValue) = \(firstValue + secondValue)")
    }
    
    func subtract(_ firstValue: Int, _ secondValue: Int){
        print("\(firstValue) - \(secondValue) = \(firstValue - secondValue)")
    }
    
    func subtract(_ firstValue: Double, _ secondValue: Double){
        print("\(firstValue) - \(secondValue) = \(firstValue - secondValue)")
    }
    
    func multiply(_ firstValue: Int, _ secondValue: Int){
        print("\(firstValue) * \(secondValue) = \(firstValue * secondValue)")
    }
    
    func multiply(_ firstValue: Double, _ secondValue: Double){
        print("\(firstValue) * \(secondValue) = \(firstValue * secondValue)")
    }
    
    func divide(_ firstValue: Int, _ secondValue: Int){
        print("\(firstValue) / \(secondValue) = \(firstValue / secondValue)")
    }
    
    func divide(_ firstValue: Double, _ secondValue: Double){
        print("\(firstValue) / \(secondValue) = \(firstValue / secondValue)")
    }
    
    func countFourDigitNumber(value: Int){
        if value > 0{
            let newValue = value % 10
            sum += newValue
            countFourDigitNumber(value: value / 10)
            
        }else{
            print("The sum of digits is \(sum)")
        }
    }
    
    func compriseStrings(_ firstString: String, _ secondString: String){
        if firstString == secondString{
            print("The string " + firstString + " and " + secondString + " are equal")
        }else if firstString > secondString{
            print("The string " + firstString + " are more than the string " + secondString)
        }else{
            print("The string " + firstString + " are less than the string " + secondString)
        }
    }
    
//    func breakProgram(value: Int){
//        if value > 0{
//            print("I broke ur program \(value) time(ы)")
//            let newValue = value + 1
//            breakProgram(value: newValue)
//        }
//    }

    func calculatePower(_ value: Int, to power: Int = 2){
        print("\(value) to the power of \(power) is \(Int(pow(Double(value), Double(power))))")
    }
    
    func calculateFactorial(_ value: Int){
        if(value > 1){
            let newValue = value - 1
            factorial *= value
            calculateFactorial(newValue)
        }else{
            print("Factorial is \(factorial)")
        }
    }
}

