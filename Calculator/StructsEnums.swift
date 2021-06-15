//
//  StructsEnums.swift
//  Calculator
//
//  Created by Alexey Yarov on 15.06.2021.
//  Copyright © 2021 Alexey Yarov. All rights reserved.
//

import Foundation

enum Operator: String  //central repository, like a bank. Central repository to store in this case Strings
{
    case add = "+"  // you can call it whatever you would like, for example case Add = "add"
    case subtract = "-"
    case times = "*"
    case divide = "/"
    case nothing = ""
}

enum CalculationState: String
{
    case enteringNum = "enteringNum"
    case newNumStarted = "newNumStarted"
}

