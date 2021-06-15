//
//  ViewController.swift
//  calculator
//
//  Created by Erick Borges on 15/06/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!
    
    private var isFinishedTypingNumber: Bool = true
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        isFinishedTypingNumber = true
        
        guard let number = Double(displayLabel.text!) else { return }
        
        switch sender.currentTitle {
        case "AC":
            displayLabel.text = "0"
        case "+/-":
            displayLabel.text = String(number * -1)
        case "%":
            displayLabel.text = String(number / 100)
        default:
            return
        }
    }
    
    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        guard let textLabel = sender.currentTitle, let label = Double(displayLabel.text!) else { return }
        
        if isFinishedTypingNumber == true {
            displayLabel.text = textLabel
            isFinishedTypingNumber = false
        } else {
            
            if textLabel == "." {
                let isInt = floor(label) == label
                if !isInt {
                    return
                }
            }
            displayLabel.text = displayLabel.text! + textLabel
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
}

