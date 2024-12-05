//
//  CalculatorViewController.swift
//  Calculator
//
//  Created by IE14 on 05/11/24.
//
import foundation
import UIKit

class CalculatorViewController: UIViewController {
    @IBOutlet weak var label: UILabel!
    
    var firstNumber : Double = 0 ;
    var secondNumber : Double = 0 ;
    var performingMath = false
    var operatorUsed : Int? = nil ;
    var displayText: String = " "
    var isDecimal: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = "0"
        // Do any additional setup after loading the view.
    }
    
    @IBAction private func allClearActionButton(_ sender: UIButton) {
        label.text = "0"
        performingMath = false
        firstNumber = 0
        secondNumber = 0
        operatorUsed = nil
        
    }
    
    @IBAction private func numberActionButton(_ sender: UIButton) {
        
        if performingMath {
            label.text = String(sender.tag)
            secondNumber = Double(label.text!)!
            performingMath = false
        } else {
            if label.text == "0" {
                label.text = String(sender.tag)
            } else {
                label.text = label.text! + String(sender.tag)
            }
            
            if let text = label.text, let doubleValue = Double(text) {
                secondNumber = doubleValue
            }
        }
    }
    
    @IBAction private func decimalButtonAction(_ sender: UIButton) {
        
        if label.text != "0" {
            let text = label.text
            if text!.contains("."){
                return
            } else {
                let update = "\(label.text!)."
                label.text = update
            }
        }
    }
    
    
    @IBAction private func operatorActionButton(_ sender: UIButton) {
        if label.text != "0" {
            if let text = label.text, let number = Double(text), sender.tag != 11 {
                firstNumber = number
            }
            
            switch sender.tag {
            case 12:                print("Second vcommit")

                operatorUsed = 12
                displayText = "\(firstNumber) +"
            case 13:
                operatorUsed = 13
                displayText = "\(firstNumber) -"
            case 14:
                operatorUsed = 14
                displayText = "\(firstNumber) *"
            case 15:
                operatorUsed = 15
                displayText = "\(firstNumber) /"
            case 16:
                operatorUsed = 16
                displayText = "\(firstNumber) %"
            default:
                break
            }
            label.text = displayText
            performingMath = true
            
        }
        
        
        if sender.tag == 11 {
            if let operatorUsed = operatorUsed {
                switch operatorUsed {
                case 12:
                    label.text = String(firstNumber + secondNumber)
                case 13:
                    label.text = String(firstNumber - secondNumber)
                    
                case 14:
                    label.text = String(firstNumber * secondNumber)
                case 15:
                    if secondNumber != 0 {
                        label.text = String(firstNumber / secondNumber)
                    } else {
                        label.text = "Error"
                    }
                case 16:
                    label.text = String((firstNumber * secondNumber)/100)
                default:
                    break
                }
            }
            
            firstNumber = 0
            secondNumber = 0
            operatorUsed = nil
            performingMath = false
        }
    }
}

