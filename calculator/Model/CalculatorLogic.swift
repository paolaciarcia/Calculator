//
//  CalculatorLogic.swift
//  calculator
//
//  Created by Erick Borges on 16/06/21.
//

import UIKit

struct CalculatorLogic {
    
    private var number: Double?
    private var intermediateCalculator: (number: Double, operation: String)?
    
    mutating func setNumber(_ number: Double) {
        self.number = number
    }
    
    mutating func getCalculations(symbol: String) -> Double? {
        if let n = number {
            switch symbol {
            case "AC":
                return 0
            case "+/-":
                return n * -1
            case "%":
                return n / 100
            case "=":
                return performNumberCalculation(n2: n)
            default:
                intermediateCalculator = (number: n, operation: symbol)
            }
        }
        return nil
    }
    
    private func performNumberCalculation(n2: Double) -> Double? {
        if let n1 = intermediateCalculator?.number, let operation = intermediateCalculator?.operation {
            
            switch operation {
            case "+":
                return n1 + n2
            case "−":
                return n1 - n2
            case "×":
                return n1 * n2
            case "÷":
                return n1 / n2
            default:
                fatalError("The operation passed in does not match any of the cases")
            }
        }
        return nil
    }
}
