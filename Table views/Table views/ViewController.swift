//
//  ViewController.swift
//  Table views
//
//  Created by Barry Keane on 9/7/17.
//  Copyright © 2017 Inotec. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

  var cellContent = ["Tom", "Bill", "Sam", "Dave", "Jim"]
  
  internal func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int  {
    
    return cellContent.count
    
  }
  
  
  internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell  {
    
    let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "Cell")
    
    cell.textLabel?.text = cellContent[indexPath.row]
    
    return cell
    
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

