//
//  ViewController.swift
//  tipster
//
//  Created by Dylan Sharkey on 3/14/16.
//  Copyright © 2016 Dylan Sharkey. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var totalValue: UILabel!
    @IBOutlet var percentOutletCollection: [UILabel]!
    @IBOutlet var totalWithTipOutletCollection: [UILabel]!
    @IBOutlet var tipOutletCollection: [UILabel]!
    private var groupSize: Int = 1
    private var tipPercent: Double = 5
    private var decimalPressed: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        totalValue.text = "0"
    }
    
    
    @IBAction func digitPressed(sender: UIButton) {
        if(totalValue.text! == "0") {
            totalValue.text = String(sender.tag)
        } else {
            totalValue.text = totalValue.text! + String(sender.tag)
        }
        calcAllValues()
    }
    
    //Resets all Values and clears text
    @IBAction func clearButtonPressed(sender: UIButton) {
        totalValue.text = "0"
        decimalPressed = false
        calcAllValues()
    }
    
    //Adds decimal point to string
    @IBAction func decimalButtonPressed(sender: UIButton) {
        if(!decimalPressed){
           decimalPressed = true
            totalValue.text = totalValue.text! + "."
            calcAllValues()
        }
        
    }
    
    @IBAction func tipPercentageSlider(sender: UISlider) {
        tipPercent = Double(sender.value)
        for i in 0...2 {
            let percent = String(tipPercent + (Double(i) * 5))
            percentOutletCollection[i].text = percent + "%"
        }
        calcAllValues()
    }
    
    @IBAction func groupSizeSlider(sender: UISlider) {
        groupSize = Int(sender.value)
        calcAllValues()
    }
    
    func calcAllValues() {
        let value:Double = Double(totalValue.text!)!
        for i in 0...2 {
            let percent = (tipPercent + (Double(i) * 5)) / 100
            let tip = (value * percent) / Double(groupSize)
            //Update UI with tip amount
            tipOutletCollection[i].text = String(tip)
            let total = value + (tip * Double(groupSize))
            //Update total amount
            totalWithTipOutletCollection[i].text = String(total)
        }
    }


}

