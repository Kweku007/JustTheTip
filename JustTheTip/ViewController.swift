//
//  ViewController.swift
//  JustTheTip
//
//  Created by Kweku Aboagye on 7/15/20.
//  Copyright © 2020 Kweku Aboagye. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    
    @IBOutlet weak var otherField: UITextField!
    @IBOutlet weak var billField: UITextField!
    
    @IBOutlet weak var tipPercent: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        billField.becomeFirstResponder()
        otherField.isUserInteractionEnabled = false
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        
        var tip: Double
        
        let bill = Double(billField.text!) ?? 0
        
        let other = Double(otherField.text!) ?? 0
        
        let tipPercentages = [0.15, 0.18, 0.20, other]
        
        if tipPercentages[tipPercent.selectedSegmentIndex] == other {
            otherField.isUserInteractionEnabled = true
            tip = other
        }
        else{
            tip = bill * tipPercentages[tipPercent.selectedSegmentIndex]
        }
        let total = bill + tip
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        
    }
}

