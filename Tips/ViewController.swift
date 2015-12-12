//
//  ViewController.swift
//  Tips
//
//  Created by Karlygash Zhuginissova on 11/30/15.
//  Copyright © 2015 Karlygash Zhuginissova. All rights reserved.
//

import UIKit

func delay(seconds seconds: Double, completion:()->()) {
    let popTime = dispatch_time(DISPATCH_TIME_NOW, Int64( Double(NSEC_PER_SEC) * seconds ))
    
    dispatch_after(popTime, dispatch_get_main_queue()) {
        completion()
    }
}

class ViewController: UIViewController /*UITextFieldDelegate*/ {
    
    let defaults = NSUserDefaults.standardUserDefaults()

  
    
 //   var userIsInTheMiddleOfTypingBillAmount = false

  
    @IBOutlet weak var billTextField: UITextField!
    
    @IBOutlet weak var tipLabel: UILabel!
    
    @IBOutlet weak var totalLabel: UILabel!
    
    @IBOutlet weak var tipSegmentedControl: UISegmentedControl!
    
    @IBOutlet weak var topView: UIView!
    
    @IBOutlet weak var bottomView: UIView!
    
    @IBOutlet weak var twoPeopleLabel: UILabel!
    
    @IBOutlet weak var threePeopleLabel: UILabel!
    
    @IBOutlet weak var fourPeopleLabel: UILabel!
    
    @IBOutlet weak var topViewConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var bottomViewConstraint: NSLayoutConstraint!

  //  @IBOutlet weak var bottomViewBottomConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        billTextField.text = defaults.stringForKey("savedBillAmountKey")
        billTextField.becomeFirstResponder()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        //Dispose of any resources that can be recreated.
    }


    @IBAction func onEditingChanged(sender: AnyObject) {
       //makePrefix()
        let digit = billTextField.text
//
//        if userIsInTheMiddleOfTypingBillAmount {
//            
//            billTextField.text = billTextField.text! + digit!
//            print(billTextField.text)
//            //             userIsInTheMiddleOfTypingBillAmount = false
//        }
//        else {
//            billTextField.text = digit
//            print(billTextField.text)
//            userIsInTheMiddleOfTypingBillAmount = true
//        }
//        
        if digit!.hasPrefix("0") {
            let newValue = String(digit!.characters.dropFirst())
            billTextField.text = newValue
        }
        
        
        if (billTextField.text?.isEmpty)! {
            UIView.animateWithDuration(0.8, delay: 0.2, options: [], animations: {
                
                self.bottomViewConstraint.constant = self.view.bounds.height
                    self.topViewConstraint.constant = 75
                self.view.layoutIfNeeded()
                }, completion: nil)
        } else
        
        {
            UIView.animateWithDuration(0.8, delay: 0.2, options: [], animations: {
                self.topViewConstraint.constant = 0
                print("it is not empty")
                self.view.layoutIfNeeded()
                }, completion: nil)
            
            UIView.animateWithDuration(0.8, delay: 0.2, options: [], animations: {
                
                self.bottomViewConstraint.constant = 0
                
                self.view.layoutIfNeeded()
                }, completion: nil)

        }
        let tipPercentages = [0.18, 0.2, 0.22]

        let tipPercentage = tipPercentages[tipSegmentedControl.selectedSegmentIndex]
        let billAmount = NSString(string: billTextField.text!).doubleValue
        defaults.setObject(billAmount, forKey: "savedBillAmountKey")
        defaults.synchronize()
       
        let tip = billAmount * tipPercentage
        let total = billAmount + tip
        
        tipLabel.text = "$\(tip)"
        totalLabel.text = "$\(total)"
        
        tipLabel.text = String(format: "$%0.2f", tip)
        totalLabel.text = String(format: "$%0.2f", total)
        
        
        twoPeopleLabel.text = String(format: "$%0.2F", total/2)
         threePeopleLabel.text = String(format: "$%0.2F", total/3)
         fourPeopleLabel.text = String(format: "$%0.2F", total/4)
    }

 
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
    

        @IBAction func editingDidEnd(sender: AnyObject) {
        
        UIView.animateWithDuration(0.8, delay: 0.2, options: [], animations: {
            
            self.bottomViewConstraint.constant = 0
            self.topViewConstraint.constant = 50
            self.view.layoutIfNeeded()
            }, completion: nil)

       
        print("I finished editing")
    }
    
    override func viewWillAppear(animated: Bool) {
    super.viewWillAppear(animated)
                     print("view will appear")
     
       bottomViewConstraint.constant = view.bounds.height
        self.view.layoutIfNeeded()
        
        
                switch (NSUserDefaults.standardUserDefaults().integerForKey("myColor")) {
                case 0:
                    self.topView.backgroundColor = UIColor.blueColor()
                    self.bottomView.backgroundColor = UIColor.redColor()
                    self.view.backgroundColor = UIColor.clearColor()
                  //  print(self.view.backgroundColor!)
                case 1:
                    self.topView.backgroundColor = UIColor.blackColor()
                    self.bottomView.backgroundColor = UIColor.blackColor()
                    self.view.backgroundColor = UIColor.yellowColor()
                    //self.view.alpha = 0.5
                default:
                    break
                    }
        
        switch (NSUserDefaults.standardUserDefaults().integerForKey("myPercent")) {
        case 0:
            tipSegmentedControl.selectedSegmentIndex = 0
        case 1:
            tipSegmentedControl.selectedSegmentIndex = 1
        case 2:
            tipSegmentedControl.selectedSegmentIndex = 2
        default:
            break
        }
   }
    

    override func viewDidAppear(animated: Bool) {
       super.viewDidAppear(animated)
        print("view did appear")
     
    }
}

