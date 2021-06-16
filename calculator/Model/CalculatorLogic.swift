//
//  CalculatorLogic.swift
//  calculator
//
//  Created by Erick Borges on 16/06/21.
//

import UIKit

struct CalculatorLogic {
    
    var number: Double
    
    init(number: Double) {
        self.number = number
    }
    
    func getCalculations(symbol: String) -> Double? {
        
        if symbol == "AC" {
            return 0
        } else if symbol == "+/-" {
            return number * -1
        } else if symbol == "%" {
            return number / 100
        }
        return nil
    }
}
