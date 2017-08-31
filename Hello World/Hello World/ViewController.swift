//
//  ViewController.swift
//  Hello World
//
//  Created by Barry Keane on 8/29/17.
//  Copyright © 2017 Inotec. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  @IBOutlet weak var ageTextField: UITextField!
  
  @IBOutlet weak var ageLabel: UILabel!
  
  
  @IBAction func submitPressed(_ sender: Any) {
    
    
    
    let ageInCatYears = Int(ageTextField.text!)! * 7
    
   ageLabel.text = String(ageInCatYears)
    
  }
 
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
    
  }

  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

