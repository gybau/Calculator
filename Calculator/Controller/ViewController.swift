//
//  ViewController.swift
//  Calculator
//
//  Created by Angela Yu on 10/09/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!
    
    
    private var isFinishedTypingNumber = true
    
    private var displayValue: Double {
        get {
            guard let number = Double(displayLabel.text!) else {
                fatalError("Cannot convert display text to a Double")
            }
            return number
        }
        set {
            displayLabel.text = String(newValue)
        }
    }
    
    var calculatorLogic = CalculatorLogic()
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        
        //What should happen when a non-number button is pressed
        isFinishedTypingNumber = true
        
        calculatorLogic.setNumber(displayValue)

        if let calcMethod = sender.currentTitle {
            
            guard let result = calculatorLogic.upperCalcButtonPressed(symbol: calcMethod) else {
                fatalError("The result of the calculation is nil")
            }
            
            displayValue = result
            
        }
    }

    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        
        //What should happen when a number is entered into the keypad
        if let buttonValue = sender.currentTitle {
            
            if isFinishedTypingNumber {
                displayLabel.text = buttonValue
                isFinishedTypingNumber = false
            } else {
                
                if buttonValue == "." {
                    
                    let isInt = floor(displayValue) == displayValue
                    
                    if !isInt {
                        return
                    }
                }
                displayLabel.text?.append(buttonValue)
            }
        }
    }

}

