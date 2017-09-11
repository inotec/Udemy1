//
//  ViewController.swift
//  Animations
//
//  Created by Barry Keane on 9/11/17.
//  Copyright © 2017 Inotec. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  // Outlets:
  
  @IBOutlet weak var button: UIButton!
  
  @IBOutlet weak var image: UIImageView!
  
  var counter = 00
  
  var timer = Timer()
  
  var running = false
    
  func animate()
  {
    if running
    {
      image.image = UIImage(named: ("frame_" + String(format: "%02d", counter) + "_delay-0.1s.gif"))
      
      counter += 1
      
      if counter > 15
      {
        counter = 0
      }
    }
  }
  
  // Actions:

  @IBAction func fadIn(_ sender: Any)
  {
    image.alpha = 0   // make invisible initially
    UIView.animate(withDuration: 3, animations:  // Graduallty fade in
    {
      self.image.alpha = 1
    })
  }
  
  @IBAction func slideIn(_ sender: Any)
  {
    
    image.center = CGPoint(x: image.center.x - 500, y: image.center.y)
    
    UIView.animate(withDuration: 3, animations:
    {
      // NOTE: "Any time you're inside a closure you need self to refer to object (ViewController) outside closure
      self.image.center = CGPoint(x: self.image.center.x + 500, y: self.image.center.y)
    })
    
  }
  
  
  @IBAction func grow(_ sender: Any)
  {
    image.frame = CGRect(x: 0, y: self.image.center.y, width: 0, height: 0)
    
    UIView.animate(withDuration: 3)
    {
      self.image.frame = CGRect(x: 0, y: self.image.center.y - 190, width: 380, height: 380)
    }
  }
  
  @IBAction func next(_ sender: Any)
  {
    // Toggle running
    running = !running
    
    // Update button label
    if running
    {
      button.setTitle("Stop Animation", for: [])  // empty brackets for controller state...I don't know why
    }
    else
    {
      button.setTitle("Start Animation", for: [])
    }
  
    timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(ViewController.animate), userInfo: nil, repeats: true)
    
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

