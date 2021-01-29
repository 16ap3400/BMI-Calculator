//
//  CalculatorBrain.swift
//  BMI Calculator
//
//  Created by Alex Peterson on 1/29/21.
//  Copyright © 2021 Angela Yu. All rights reserved.
//

import Foundation
import UIKit

struct CalculatorBrain {
    var bmi: BMI?
    
    func getBMIValue() -> String {
        let bmiString = "\(String(format: "%.1f", bmi?.value ?? 0.0))"
        return bmiString
    }
    
    func getAdvice() -> String {
        return bmi?.advice ?? "Default"
    }
    
    func getColor() -> UIColor {
        return bmi?.color ?? .purple
    }
    
    mutating func calculateBMI(height: Float, weight: Float) {
        let bmiValue = ( weight / (height * height) )
        
        if bmiValue < 18.5 {
            bmi = BMI(value: bmiValue, advice: "Underweight", color: #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1))
        }else if bmiValue < 24.9 {
            bmi = BMI(value: bmiValue, advice: "Normal", color: #colorLiteral(red: 0, green: 0.8187416792, blue: 0.4484632015, alpha: 1))
        }else{
            bmi = BMI(value: bmiValue, advice: "Eat less pies", color: #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1))
        }
    }
}
