//
//  ViewController.swift
//  Location Aware
//
//  Created by Barry Keane on 9/14/17.
//  Copyright © 2017 Inotec. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate
{

    @IBOutlet weak var latitudeLabel: UILabel!
    @IBOutlet weak var longitudeLabel: UILabel!
    @IBOutlet weak var courseLabel: UILabel!
    @IBOutlet weak var speedLabel: UILabel!    
    @IBOutlet weak var altitudeLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    
    var manager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
        
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation])
    {
        let location = locations[0]                // NOTE: don't need to check items, because location will always have these values
        self.latitudeLabel.text = String(location.coordinate.latitude)
        self.longitudeLabel.text = String(location.coordinate.longitude)
        self.courseLabel.text = String(location.course)
        self.speedLabel.text = String(location.speed)
        self.altitudeLabel.text = String(location.altitude)
        
        CLGeocoder().reverseGeocodeLocation(location) { (placemarks, error) in
            
            if error != nil
            {
                print(error)
            } else {
                if let placemark = placemarks?[0]
                {
                    var address = ""
                    if placemark.subThoroughfare != nil
                    {
                        address += placemark.subThoroughfare! + " "
                    }
                    print("1:" + address)
                    if placemark.thoroughfare != nil
                    {
                        address += placemark.thoroughfare! + "\n"
                    }
                    print("2:" + address)
                    if placemark.subLocality != nil
                    {
                        address += placemark.subLocality! + "\n"
                    }
                    print("3:" + address)
                    if placemark.subLocality != nil
                    {
                        address += placemark.subLocality! + "\n"
                    }
                    print("4:" + address)
                    if placemark.subAdministrativeArea != nil
                    {
                        address += placemark.subAdministrativeArea! + "\n"
                    }
                    print("5:" + address)
                    if placemark.country != nil
                    {
                        address += placemark.country! + "\n"
                    }
                    print("6:" + address)
                    self.addressLabel.text = address
                }
            }
        }
            
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

