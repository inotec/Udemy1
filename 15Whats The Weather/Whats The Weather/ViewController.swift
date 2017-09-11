//
//  ViewController.swift
//  Whats The Weather
//
//  Created by Barry Keane on 9/10/17.
//  Copyright © 2017 Inotec. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
  
  
  
  @IBOutlet weak var cityTextField: UITextField!
  

  @IBOutlet weak var resultLabel: UILabel!
  
  
  
  @IBAction func getWeather(_ sender: Any) {
    
    self.downloadWeather(cityName: cityTextField.text!)
    
  }
  
  func downloadWeather(cityName: String) -> Void {
    
    DispatchQueue.main.async {
      self.resultLabel.text = "Loading..."
    }
    
    let url = URL(string: "http://www.weather-forecast.com/locations/\(cityName.replacingOccurrences(of: " ", with:"-"))/forecasts/latest")!  // force unwrap since we created it and we know it exists
    
    let request = NSMutableURLRequest(url: url)
    
    let task = URLSession.shared.dataTask(with: request as URLRequest) {
      data, response, error in
      
      if error != nil  {
        
        print(error)
      } else {
        
        if let unwrappedData = data {
          
          let dataString = NSString(data: unwrappedData, encoding: String.Encoding.utf8.rawValue)
          
          var  stringSeparator = "Weather Forecast Summary:</b><span class=\"read-more-small\"><span class=\"read-more-content\"> <span class=\"phrase\">"
          
          if let contentArray = dataString?.components(separatedBy: stringSeparator) {
            
            if contentArray.count > 0 {
              
              stringSeparator = "</span>"
              
              let newContentArray = contentArray[1].components(separatedBy: stringSeparator)
              
              if newContentArray.count > 0 {
                DispatchQueue.main.async {
                  self.resultLabel.text = newContentArray[0].replacingOccurrences(of: "&deg;", with:"°")
                  self.cityTextField.text = ""
                }
                
                
              }
              
              
            }
            
          }
          
        }
        
      }
      
    }
    
    task.resume()

  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    self.cityTextField.delegate = self    //

  }
  
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {   // This is executed when you hit RETURN
    
    self.downloadWeather(cityName: cityTextField.text!)
    
    return true
    
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

