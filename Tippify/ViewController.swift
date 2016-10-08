//
//  ViewController.swift
//  Tippify
//
//  Created by Marco Pizarro on 6/21/16.
//  Copyright © 2016 Marco Pizarro. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var Controller: UISegmentedControl!
    @IBOutlet weak var tip: UILabel!
    @IBOutlet weak var total: UILabel!
    @IBOutlet weak var subtotal: UITextField!
    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var valueLabel: UILabel!
    @IBOutlet weak var perPerson: UILabel!
    
    
    var tipText = "Tip: 0"
    var totalText = "Total: 0"
    
    var totalTotal = 00.0;
    
    var percent = 0.1;
    var tipNum = 0.0;
    var totalNum = 1.0;
    
    var finalTip = 0.0;
    var finalTotal = 0.0;
    var amountPerPerson = 0.0;
    
    var people = 1;
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        view.endEditing(true)
        super.touchesBegan(touches, with: event)
    }
    
    override func viewDidLoad(
        ) {
        super.viewDidLoad()
        
               // Do any additional setup after loading the view, typically from a nib.
        stepper.wraps = true
        stepper.autorepeat = true
        stepper.maximumValue = 9
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func changeTip(_ sender: AnyObject) {
        if Controller.selectedSegmentIndex == 0{
            percent = 0.1;
        }
        else if Controller.selectedSegmentIndex == 1{
            percent = 0.15;
        }
        else if Controller.selectedSegmentIndex == 2{
            percent = 0.2;
        }
        
       
       
        
    }
    
    @IBAction func calculate(_ sender: UIButton) {
        subtotal.resignFirstResponder()
        
        self.tip.isHidden = false
        self.total.isHidden = false
        
        
        tipNum = Double(subtotal.text!)! * percent
         totalTotal = tipNum + Double(subtotal.text!)!
        
        finalTip = ceil(tipNum)
        finalTotal = ceil(totalTotal)
    
        tip.text = "Tip: \(String(finalTip)) "
       
        
        total.text = "Total: \(String(finalTotal)) "
        
        if(people == 1){
            valueLabel.text = "\(people) Person "
        }
        else{
            valueLabel.text = "\(people) People "
        }
        
        amountPerPerson = totalTotal / Double(people)
        
        amountPerPerson = ceil(amountPerPerson)
        perPerson.text = "\(String(amountPerPerson)) Per Person "
        
    }
    
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        
        people = Int(sender.value+1);
     
        if(people == 1){
            valueLabel.text = "\(people) Person "
        }
        else{
        valueLabel.text = "\(people) People "
        }
        
        amountPerPerson = totalTotal / Double(people)
        
        amountPerPerson = ceil(amountPerPerson)
        perPerson.text = "\(String(amountPerPerson)) Per Person "
        
    }

}

