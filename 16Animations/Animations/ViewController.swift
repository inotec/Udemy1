//
//  ViewController.swift
//  Animations
//
//  Created by Barry Keane on 9/11/17.
//  Copyright © 2017 Inotec. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  
  @IBOutlet weak var image: UIImageView!
  
  var counter = 00
  
  @IBAction func next(_ sender: Any)
  {
    image.image = UIImage(named: ("frame_" + String(format: "%02d", counter) + "_delay-0.1s.gif"))
    
    counter += 1
    
    if counter > 15
    {
      counter = 0
    }
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

