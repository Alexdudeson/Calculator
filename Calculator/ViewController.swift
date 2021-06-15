//
//  ViewController.swift
//  Calculator
//
//  Created by Alexey Yarov on 15.06.2021.
//  Copyright © 2021 Alexey Yarov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var currentOperation: Operator = Operator.nothing //property are all with lower case
    var calcState: CalculationState = CalculationState.enteringNum
    
    
    var firstValue: String = ""
    
    @IBOutlet weak var resultLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
//button actions
    @IBAction func numberClicked (_ sender: UIButton)
    {
        updateDisplay (number: String (sender.tag))
    }
    
    func updateDisplay (number: String)
    {
        if calcState == CalculationState.newNumStarted
        {
            if let num = resultLabel.text
            {
                if num != ""
                {
                    firstValue = num
                }
            }
            calcState = CalculationState.enteringNum
            resultLabel.text = number
        }
        else if calcState == CalculationState.enteringNum
        {
            resultLabel.text = resultLabel.text! + number
            // "cat" + "dog" = "cat dog" <-- concatination
        }
    }
    
    @IBAction func operatorClicked (_ sender: UIButton)
    {
        calcState = CalculationState.newNumStarted
        
        if let num = resultLabel.text
        {
            if num != ""
            {
                firstValue = num
                resultLabel.text = ""
            }
        }
        
        switch sender.tag
        {
        case 10:
            currentOperation = Operator.add
        case 11:
            currentOperation = Operator.subtract
        case 12:
            currentOperation = Operator.times
        case 13:
            currentOperation = Operator.divide
        default:
        return
        }
    }
    
    @IBAction func equalsClicked (_ sender: UIButton)
    {
        calculateSum ()
    }
    func calculateSum ()
    {
        if (firstValue.isEmpty)
        {
            return
        }
        var result = ""
        if currentOperation == Operator.times
        {
            result = "\(Double(firstValue)! * Double(resultLabel.text!)!)" // ! <-- (Force unwrap) Had to do so, due to logic and small lack of knowledge. Here we control first Value, and it allways should be a number. Here we can control value.
        }
        else if currentOperation == Operator.divide
        {
            result = "\(Double(firstValue)! / Double(resultLabel.text!)!)" // <-- "\(something)" Helps to convert it to String.
        }
        else if currentOperation == Operator.add
        {
            result = "\(Double(firstValue)! + Double(resultLabel.text!)!)"
        }
        else if currentOperation == Operator.subtract
        {
            result = "\(Double(firstValue)! - Double(resultLabel.text!)!)"
        }
        
        resultLabel.text = result
        calcState = CalculationState.newNumStarted
    }

}

