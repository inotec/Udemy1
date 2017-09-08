//
//  ViewController.swift
//  Controlling the Keyboard
//
//  Created by Barry Keane on 9/8/17.
//  Copyright © 2017 Inotec. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    self.view.endEditing(true)    // Removes keyboard if we touch outside keyboard
    // NOTE: self refers to ViewController
    
  }
  
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    textField.resignFirstResponder()   // Shuts down keyboard for textField being edited NOTE must put in () for this one
    return true
  }

  
  
  
}

