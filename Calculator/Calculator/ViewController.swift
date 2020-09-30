//
//  ViewController.swift
//  Calculator
//
//  Created by Алина Ненашева on 9/28/20.
//  Copyright © 2020 Алина Ненашева. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var numberLabel: UILabel!
    
    @IBOutlet weak var clearButton: UIButton!
    
    @IBOutlet weak var changeSignButton: UIButton!
    
    @IBOutlet weak var persentButton: UIButton!
    
    @IBOutlet weak var devisionButton: UIButton!
    
    @IBOutlet weak var sevenButton: UIButton!
    
    @IBOutlet weak var eightButton: UIButton!
    
    
    @IBOutlet weak var nineButton: UIButton!
    
    @IBOutlet weak var multplicationButton: UIButton!
    
    @IBOutlet weak var fourButton: UIButton!
    
    @IBOutlet weak var fiveButton: UIButton!
    
    @IBOutlet weak var sixButton: UIButton!
    
    @IBOutlet weak var substractionButton: UIButton!
    
    @IBOutlet weak var oneButton: UIButton!
    
    @IBOutlet weak var twoButton: UIButton!
    
    @IBOutlet weak var threeButton: UIButton!
    
    @IBOutlet weak var additionButton: UIButton!
    
    @IBOutlet weak var zeroButton: UIButton!
    
    @IBOutlet weak var pointButton: UIButton!
    
    @IBOutlet weak var equalButton: UIButton!
    
    var numbers = [Double]()
    enum Operation {
        case multiplication
        case devision
        case substraction
        case addition
        case none
    }
    var operation: Operation = .none
    var numberForDevision = 0.0
    var lastNumber = 0.0
    var operationResult = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        clearButton.layer.cornerRadius = clearButton.frame.width/2
        changeSignButton.layer.cornerRadius = changeSignButton.frame.width/2
        persentButton.layer.cornerRadius = persentButton.frame.width/2
        devisionButton.layer.cornerRadius = devisionButton.frame.width/2
        sevenButton.layer.cornerRadius = sevenButton.frame.width/2
        eightButton.layer.cornerRadius = eightButton.frame.width/2
        nineButton.layer.cornerRadius = nineButton.frame.width/2
        multplicationButton.layer.cornerRadius = multplicationButton.frame.width/2
        fourButton.layer.cornerRadius = fourButton.frame.width/2
        fiveButton.layer.cornerRadius = fiveButton.frame.width/2
        sixButton.layer.cornerRadius = sixButton.frame.width/2
        substractionButton.layer.cornerRadius = substractionButton.frame.width/2
        oneButton.layer.cornerRadius = oneButton.frame.width/2
        twoButton.layer.cornerRadius = twoButton.frame.width/2
        threeButton.layer.cornerRadius = threeButton.frame.width/2
        additionButton.layer.cornerRadius = additionButton.frame.width/2
        zeroButton.layer.cornerRadius = zeroButton.frame.height/2
        pointButton.layer.cornerRadius = pointButton.frame.height/2
        equalButton.layer.cornerRadius = equalButton.frame.width/2
    }

    func printDigit(_ digit: String){
        if operationResult {
            numberLabel.text! = ""
        }
        if numberLabel.text!.count < 7 {
        if numberLabel.text != "0" {
        numberLabel.text = numberLabel.text! + digit
        } else {
            numberLabel.text = digit
            }
        }
    }
    
    @IBAction func oneButtonPressed(_ sender: Any) {
        printDigit("1")
    }
    
    @IBAction func twoButtonPressed(_ sender: Any) {
        printDigit("2")
    }
    
    @IBAction func threeButtonPressed(_ sender: Any) {
        printDigit("3")
    }
    
    @IBAction func fourButtonPressed(_ sender: Any) {
        printDigit("4")
    }
    
    @IBAction func fiveButtonPressed(_ sender: Any) {
        printDigit("5")
    }
    
    @IBAction func sixButtonPressed(_ sender: Any) {
         printDigit("6")
    }
    
    @IBAction func sevenButtonPressed(_ sender: Any) {
        printDigit("7")
    }
    
    @IBAction func eightButtonPressed(_ sender: Any) {
        printDigit("8")
    }
    
    @IBAction func nineButtonPressed(_ sender: Any) {
        printDigit("9")
    }
    
    @IBAction func zeroButtonPressed(_ sender: Any) {
        if numberLabel.text != "0" {
            if numberLabel.text!.count < 7 && numberLabel.text!.prefix(2) == "0." || numberLabel.text!.prefix(1) != "0" {
                numberLabel.text = numberLabel.text! + "0"
            }
        } else {
            numberLabel.text = "0"
        }
    }
    @IBAction func pointButtonPressed(_ sender: Any) {
        var count = 0
        for letter in numberLabel.text! {
            if letter == "." {
                count += 1
            }
        }
        if count == 0 && numberLabel.text!.count < 6{
            numberLabel.text! += "."
        }
    }
    @IBAction func additionButtonPressed(_ sender: Any) {
        numbers.append(Double(numberLabel.text!)!)
        numberLabel.text! = "0"
        operation = .addition
        if numbers.count == 2 {
            let newNumber = numbers[0] + numbers[1]
            numbers.removeAll()
            numbers.append(newNumber)
            numberLabel.text! = String(newNumber)
            checkFractional()
            numberLabel.text! = correctSizeNotification(numberLabel.text!)
            operationResult = true
        }
    }
    
    @IBAction func multiplicationButtonPressed(_ sender: Any) {
        numbers.append(Double(numberLabel.text!)!)
        numberLabel.text! = "0"
        operation = .multiplication
        if numbers.count == 2 {
            let newNumber = numbers[0] * numbers[1]
            numbers.removeAll()
            numbers.append(newNumber)
            numberLabel.text! = String(newNumber)
            checkFractional()
            numberLabel.text! = correctSizeNotification(numberLabel.text!)
            operationResult = true
        }
    }

    @IBAction func devisionButtonPressed(_ sender: Any) {
        numbers.append(Double(numberLabel.text!)!)
        if numbers.count == 1 {
        numberForDevision = Double(numberLabel.text!)!
    }
        numberLabel.text! = "0"
        operation = .devision
        if numbers.count == 2 {
            let newNumber = numberForDevision / numbers[1]
            numbers.removeAll()
            numbers.append(newNumber)
            let newNumberString = String(newNumber)
            numberLabel.text! = "" + newNumberString.prefix(7)
            checkFractional()
            operationResult = true
        }
    }
    
    @IBAction func substractionButtonPressed(_ sender: Any) {
        numbers.append(Double(numberLabel.text!)!)
        numberLabel.text! = "0"
        operation = .substraction
        if numbers.count == 2 {
            let newNumber = numbers[0] - numbers[1]
            numbers.removeAll()
            numbers.append(newNumber)
            numberLabel.text! = String(newNumber)
            checkFractional()
            numberLabel.text! = correctSizeNotification(numberLabel.text!)
            operationResult = true
        }
    }
    
    @IBAction func clearButtonPressed(_ sender: Any) {
        numbers.removeAll()
        numberLabel.text! = "0"
    }
    
    @IBAction func changeSignButtonPressed(_ sender: Any) {
        if numberLabel.text! != "0" {
            if numberLabel.text!.prefix(1)  == "-" {
                numberLabel.text!.removeFirst()
            } else {
                numberLabel.text! = "-" + numberLabel.text!
            }
        }
    }
    
    @IBAction func persentButtonPressed(_ sender: Any) {
        numberLabel.text! = String(Double(numberLabel.text!)!/100)
        if numberLabel.text!.count > 7 {
        let newNumberString = numberLabel.text!
            numberLabel.text! = String(newNumberString.prefix(7))
        }
    }
    
    func correctSizeNotification(_ number: String)-> String{
        if number.count > 7 {
            return "too big"
        } else {
            return number
        }
    }

    func checkFractional(){
        if numberLabel.text!.suffix(2) == ".0" {
            numberLabel.text!.removeLast(2)
        }
    }
    
    @IBAction func equalButtonPressed(_ sender: Any) {
        lastNumber = Double(numberLabel.text!)!
        switch operation {
        case .addition:
            if numbers.count == 1 {
                numberLabel.text! = String(lastNumber + numbers[0])
                if numberLabel.text!.count > 7 {
                let newNumberString = numberLabel.text!
                    numberLabel.text! = String(newNumberString.prefix(7))
                }
                checkFractional()
            }
        case .devision:
            if numbers.count == 1 {
                numberLabel.text! = String(numberForDevision / lastNumber)
                if numberLabel.text!.count > 7 {
                let newNumberString = numberLabel.text!
                    numberLabel.text! = String(newNumberString.prefix(7))
                }
                checkFractional()
            }
        case .multiplication:
            if numbers.count == 1 {
                numberLabel.text! = String(lastNumber * numbers[0])
                if numberLabel.text!.count > 7 {
                let newNumberString = numberLabel.text!
                    numberLabel.text! = String(newNumberString.prefix(7))
                }
                checkFractional()
            }
        case .substraction:
            if numbers.count == 1 {
                numberLabel.text! = String(numbers[0] - lastNumber)
                if numberLabel.text!.count > 7 {
                let newNumberString = numberLabel.text!
                    numberLabel.text! = String(newNumberString.prefix(7))
                }
                checkFractional()
            }
        case .none:
            print("")
        }
        numbers.removeAll()
    }
}

