//
//  ViewController.swift
//  Is it Prime
//
//  Created by Barry Keane on 9/5/17.
//  Copyright © 2017 Inotec. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  
  
  @IBOutlet weak var numEntered: UITextField!
  
  
  @IBOutlet weak var result: UILabel!
  
  
  @IBAction func buttPressed(_ sender: Any) {
    

    
    var isPrime = true
    
    
    if let text = numEntered.text {
      
      let number =  Int(text)
      
      var i = number! - 1
      
      while ( i > 1 ) {
        
        if number! % i == 0 {
          
          isPrime = false
          
        }
        
        i -= 1
        
      }
      
      if isPrime {
        result.text = "Prime!"
      } else {
        result.text = "Not prime!"
      }
      
    }
  }
}

