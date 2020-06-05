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
    //@IBOutlet weak var ETALabel: UILabel!
    
    typealias ETAHandler = (MKDirections.ETAResponse?, Error?) -> Void
    
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapkitView.delegate = self
        mapkitView.showsScale = true
        mapkitView.showsPointsOfInterest = true
        mapkitView.showsUserLocation = true
        
        locationManager.requestAlwaysAuthorization()
        locationManager.requestWhenInUseAuthorization()
        
        
        if CLLocationManager.locationServicesEnabled(){
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.startUpdatingLocation()
        }
        
        let sourceCoordinates = (locationManager.location?.coordinate)!
        let destCoordinates = CLLocationCoordinate2DMake(34.0246, -118.4739)
        let sourcePlacemark = MKPlacemark(coordinate: sourceCoordinates)
        let destPlacemark = MKPlacemark(coordinate: destCoordinates)
        let sourceItem = MKMapItem(placemark: sourcePlacemark)
        let destItem = MKMapItem(placemark: destPlacemark)
        let directionRequest = MKDirections.Request()
        directionRequest.source = sourceItem
        directionRequest.destination = destItem
        directionRequest.transportType = .walking
        
        let directions = MKDirections(request: directionRequest)
        directions.calculate(completionHandler: {
            response, error in
            
            guard let response = response else {
                if error != nil{
                    print("Error")
                }
                return
            }
            
            let route = response.routes[0]
            self.mapkitView.addOverlay(route.polyline, level: .aboveRoads)
            
            let rekt = route.polyline.boundingMapRect
            self.mapkitView.setRegion(MKCoordinateRegion(rekt), animated: true)
        })
        
    }
    
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        let renderer = MKPolylineRenderer(overlay: overlay)
        renderer.strokeColor = UIColor.blue
        renderer.lineWidth = 5.0
        
        return renderer
    }
    
        /*
    class func requestETA(userCLLocation: CLLocation, coordinate: CLLocationCoordinate2D) -> String {

        var travelTime = String()

        let request = MKDirections.Request()
        /* Source MKMapItem */
        let sourceItem = MKMapItem(placemark: MKPlacemark(coordinate: userCLLocation.coordinate, addressDictionary: nil))
        request.source = sourceItem
        /* Destination MKMapItem */
        let destinationItem = MKMapItem(placemark: MKPlacemark(coordinate: coordinate, addressDictionary: nil))
        request.destination = destinationItem
        request.requestsAlternateRoutes = false
        // Looking for walking directions
        request.transportType = MKDirectionsTransportType.walking

        // You use the MKDirectionsRequest object constructed above to initialise an MKDirections object
        let directions = MKDirections(request: request)
        directions.calculateETA { (etaResponse, error) -> Void in
            if let error = error {
                print("Error while requesting ETA : \(error.localizedDescription)")
                travelTime = "Not Available"
            }else{
                print("No error requesting ETA")
                travelTime = "\(Int((etaResponse?.expectedTravelTime)!/60)) min"
            }
        }

        return travelTime
    }
*/

}

