//
//  ViewController.swift
//  calculator
//
//  Created by Erick Borges on 15/06/21.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!
    
    private var isFinishedTypingNumber: Bool = true
    
    var displayValue: Double {
        get {
            guard let number = Double(displayLabel.text!) else { fatalError("could not convert displayLabel.text to a Double") }
            return number
        }
        set {
            displayLabel.text = String(newValue)
        }
    }
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        isFinishedTypingNumber = true
        
        if let calcMethod = sender.currentTitle {
            let calculatorLogic = CalculatorLogic(number: displayValue)
            
            guard let results = calculatorLogic.getCalculations(symbol: calcMethod) else {
                return
            }
            displayValue = results
        }
    }
    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        guard let textLabel = sender.currentTitle else { return }
        
        if isFinishedTypingNumber == true {
            displayLabel.text = textLabel
            isFinishedTypingNumber = false
        } else {
            
            if textLabel == "." {
                let isInt = floor(displayValue) == displayValue
                if !isInt {
                    return
                }
            }
            displayLabel.text = displayLabel.text! + textLabel
        }
    }
}

