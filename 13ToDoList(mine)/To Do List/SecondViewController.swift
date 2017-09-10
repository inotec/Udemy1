//
//  SecondViewController.swift
//  To Do List
//
//  Created by Rob Percival on 17/06/2016.
//  Copyright © 2016 Appfish. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate {
    
    
  @IBOutlet var itemTextField: UITextField!
  
  @IBAction func add(_ sender: AnyObject) {
    
    self.addItem(textToAdd: self.itemTextField.text!)
    
    // reset the text field
    itemTextField.text = ""
  }
  
  func addItem(textToAdd:String)
  {
    // IF items does not yet exist in UserDefaults,
    // set an empty array as the initial value
    if (UserDefaults.standard.object(forKey: "items") == nil)
    {
      let emptyItems:[String] = Array()
      UserDefaults.standard.set(emptyItems, forKey: "items")
    }
    
    // IF I get items back from UserDefaults as an array of Strings
    if var items = UserDefaults.standard.object(forKey: "items") as? [String]
    {
      // add the last item to the end
      items.append(textToAdd)
      
      // replace the version stored in UserDefaults
      UserDefaults.standard.set(items, forKey: "items")
    }
  }
  
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        self.view.endEditing(true)
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        
        return true
        
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

