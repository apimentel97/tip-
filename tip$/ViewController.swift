//
//  ViewController.swift
//  tip$
//
//  Created by Alejandro Pimentel on 2/1/19.
//  Copyright © 2019 Alejandro pimentel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var tippersLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    
   @IBAction func tippersSlider(_ sender: UISlider) {
        //Get the number of tippers
       tippersLabel.text = String(Int(sender.value))
   }
    
    
    @IBAction func calculateTip(_ sender: Any) {
        //Get bill amount
        let bill = Double(billField.text!) ?? 0
       
        //Get the number of tippers
        let tippers = Double(tippersLabel.text!) ?? 1
        
        //Calculate the tip and total
        let tipPercentages = [0.1, 0.15, 0.2]
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = (bill + tip)/tippers
        
        //Update the tip and total labels
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format:"$%.2f", total)
    }
}

