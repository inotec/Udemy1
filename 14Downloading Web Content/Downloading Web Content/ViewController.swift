//
//  ViewController.swift
//  Downloading Web Content
//
//  Created by Barry Keane on 9/10/17.
//  Copyright © 2017 Inotec. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  
  @IBOutlet weak var webview: UIWebView!
  
  
  
  
  

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
    /*
    let url = URL(string: "https://www.stackoverflow.com")!   // "force unwrap because we know this is valid URL
    
    //webview.loadRequest(URLRequest(url: url))
    
    webview.loadHTMLString("<h1>Hello there!</h1>", baseURL: nil)
    */
    
    
    // See if url can be created from this string
    if let url = URL(string: "https://www.stackoverflow.com") {
      
      // if so, create request from the url
      let request = NSMutableURLRequest(url: url)
      
      // create a task which is a url session, a bit like opening a browser window
      let task = URLSession.shared.dataTask(with: request as URLRequest)  {
        data, response, error in          // looking for these 3 variables in the code below
        
        if error != nil {
          print(error!)
        } else {
          if let unwrappedData = data {
            let dataString = NSString(data: unwrappedData, encoding: String.Encoding.utf8.rawValue)
            
            print(dataString!)
            
            // If we want to do something NOW without waiting for the load we do this...
            DispatchQueue.main.sync(execute:  {
              
              // Update UI here
              
            })
            
          }
        }
        
        
      }
      
      task.resume()
    }
    
    print("Hi there!")
    
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

