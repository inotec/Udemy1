//
//  ViewController.swift
//  Menu Bars
//
//  Created by Barry Keane on 9/7/17.
//  Copyright © 2017 Inotec. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
 
  var timer = Timer()
  
  var time = 210
  
  func decreaseTimer() {
    if time > 0 {
      time -= 1
      displayTime.text = String(time)
    } else {
      timer.invalidate()
    }
  }
  
  
  @IBOutlet weak var displayTime: UILabel!

  @IBAction func pauseButt(_ sender: Any) {
    timer.invalidate()
  }
  
  @IBAction func playButt(_ sender: Any) {
    timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.decreaseTimer), userInfo: nil, repeats: true)
  }
  
  @IBAction func minusTen(_ sender: Any) {
    if time > 10 {
      time -= 10
      displayTime.text = String(time)
    }
  }
  
  @IBAction func plusTen(_ sender: Any) {
    time += 10
    displayTime.text = String(time)
  }
  
  @IBAction func resetButt(_ sender: Any) {
    time = 210
    displayTime.text = String(time)
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

