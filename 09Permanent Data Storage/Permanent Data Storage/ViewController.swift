//
//  ViewController.swift
//  Permanent Data Storage
//
//  Created by Barry Keane on 9/8/17.
//  Copyright © 2017 Inotec. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
    
    // Run once with the following line.  After that, this item is permanently stored, so can comment out and it still prints
    // UserDefaults.standard.set("Rob", forKey: "name")

    let nameObject = UserDefaults.standard.object(forKey: "name")   // nameObject is not necessarily String
    
    if let name = nameObject as? String  {                          // We only print if we successfully cast to String
      print(name)
    }
    
    
    let arr = [1, 2, 3, 4]
    
    // Run once with the following line.  After that, this item is permanently stored, so can comment out and it still prints
    //UserDefaults.standard.set(arr, forKey: "array")
    
    let arrayObject = UserDefaults.standard.object(forKey: "array")
    
    if let array = arrayObject as? NSArray {
      print(array)
    }
    
  }

  
  
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

