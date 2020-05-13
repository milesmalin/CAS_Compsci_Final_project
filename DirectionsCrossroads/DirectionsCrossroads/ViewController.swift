//
//  ViewController.swift
//  DirectionsCrossroads
//
//  Created by Miles Malin on 5/12/20.
//  Copyright © 2020 Miles Malin. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    @IBOutlet weak var mapkitView: MKMapView!
    
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapkitView.delegate = self
        mapkitView.showsScale = true
        mapkitView.showsPointsOfInterest = true
        mapkitView.showsUserLocation = true
        
        locationManager.requestAlwaysAuthorization()
        locationManager.requestWhenInUseAuthorization()
        
        
    }


}

