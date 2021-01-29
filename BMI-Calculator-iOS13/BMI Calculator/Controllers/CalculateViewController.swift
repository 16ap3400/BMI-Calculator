//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {

    var calculatorBrain = CalculatorBrain()
    
    @IBOutlet weak var heightValue: UILabel!
    @IBOutlet weak var weightValue: UILabel!
    @IBOutlet weak var weightSliderValue: UISlider!
    @IBOutlet weak var heightSliderValue: UISlider!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func heightSliderChanged(_ sender: UISlider) {
        heightValue.text = "\(String(format: "%.2f", sender.value))m    \(String(format: "%.2f", (sender.value * 3.28084)))ft"
    }
    
    @IBAction func weightSliderChanged(_ sender: UISlider) {
        weightValue.text = "\(String(format: "%.0f", sender.value))m    \(String(format: "%.0f", (sender.value * 2.20462)))lbs"
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        calculatorBrain.calculateBMI(height: heightSliderValue.value, weight: weightSliderValue.value)
        self.performSegue(withIdentifier: "goToResults", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResults" {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.bmiValue = calculatorBrain.getBMIValue()
            destinationVC.advice = calculatorBrain.getAdvice()
            destinationVC.color = calculatorBrain.getColor()

        }
    }
}

