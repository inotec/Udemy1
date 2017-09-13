//
//  ViewController.swift
//  Maps
//
//  Created by Barry Keane on 9/12/17.
//  Copyright © 2017 Inotec. All rights reserved.
//

import UIKit
import MapKit


class ViewController: UIViewController, MKMapViewDelegate {
    
    @IBOutlet weak var map: MKMapView!
    
    
    

    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        // The basic map kit setup
        let latitude: CLLocationDegrees = 55.6791764
        let longitude: CLLocationDegrees = 12.5902801
        let latDelta: CLLocationDegrees = 0.1
        let lonDelta: CLLocationDegrees = 0.1
        let span: MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: latDelta, longitudeDelta: lonDelta)
        //let location: CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        let coordinates = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        let region: MKCoordinateRegion = MKCoordinateRegion(center: coordinates, span: span)
        
        map.setRegion(region, animated: true)
        
        // Set up a pin with annotation at a specific location
        let annotation = MKPointAnnotation()
        annotation.title = "Copenhagen"
        annotation.subtitle = "Love it!"
        annotation.coordinate = coordinates
        map.addAnnotation(annotation)
        
        let uilpgr = UILongPressGestureRecognizer(target: self, action: #selector(ViewController.longpress(gestureRecognizer:)))  // Must have colon or info will not be sent to
        uilpgr.minimumPressDuration = 2                                                          // func below
        map.addGestureRecognizer(uilpgr)
        
    
    }
    
    func longpress(gestureRecognizer: UIGestureRecognizer)
    {
        print("Long Press...")
        let touchPoint = gestureRecognizer.location(in: self.map)
        let coordinate = map.convert(touchPoint, toCoordinateFrom: self.map)
        let annotation = MKPointAnnotation()
        annotation.coordinate = coordinate
        annotation.title = "New place"
        annotation.subtitle = "Let's go"
        map.addAnnotation(annotation)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

