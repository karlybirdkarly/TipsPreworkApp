//
//  SettingsViewController.swift
//  Tips
//
//  Created by Karlygash Zhuginissova on 11/30/15.
//  Copyright © 2015 Karlygash Zhuginissova. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    let myDefaults = NSUserDefaults.standardUserDefaults()
    //let myColor = "myColor"
    
    @IBOutlet weak var tipPercentageSegmentedControl: UISegmentedControl!

    override func viewDidLoad() {
        super.viewDidLoad()
        
       

        // Do any additional setup after loading the view.
    }

    @IBAction func saveSettingButtonPressed(sender: AnyObject) {
        print(segmentedControl.selectedSegmentIndex)
        myDefaults.setInteger(segmentedControl.selectedSegmentIndex, forKey: "myColor")
        
        myDefaults.setInteger(tipPercentageSegmentedControl.selectedSegmentIndex, forKey: "myPercent")
        
        myDefaults.synchronize()
               //dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
