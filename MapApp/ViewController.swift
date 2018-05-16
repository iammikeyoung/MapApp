//
//  ViewController.swift
//  MapApp
//
//  Created by Michael Young on 5/15/18.
//  Copyright © 2018 Michael Young. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate {
    @IBOutlet weak var mapView: MKMapView!
    
    //Empire State Building coordinates
    var latitude = 40.7485413
    var longitude = -73.98575770000002
    var locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
        setMapArea()
        addPin()
    }
    
    func setMapArea() {
        let coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        let span = MKCoordinateSpanMake(0.005, 0.005)
        let region = MKCoordinateRegion(center: coordinate, span: span)
        mapView.setRegion(region, animated: true)
    }
    
    func addPin() {
        let pinLocation: CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude)
        let pinObject = MKPointAnnotation()
        pinObject.coordinate = pinLocation
        pinObject.title = "Empire State Building"
        pinObject.subtitle = "350 5th Ave, New York, NY 10118"
        mapView.addAnnotation(pinObject)
    }
    
    @IBAction func standardPressed(_ sender: UIBarButtonItem) {
        mapView.mapType = MKMapType.standard
    }

    @IBAction func satellitePressed(_ sender: UIBarButtonItem) {
        mapView.mapType = MKMapType.satellite
    }
    
    @IBAction func hybridPressed(_ sender: UIBarButtonItem) {
        mapView.mapType = MKMapType.hybrid
    }
    
    @IBAction func locateMePressed(_ sender: UIBarButtonItem) {
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        mapView.showsUserLocation = true
    }
    
    @IBAction func directionsPressed(_ sender: UIBarButtonItem) {
        UIApplication.shared.open(URL(string: "http://maps.apple.com/maps?daddr=\(latitude),\(longitude)")!, options: [:], completionHandler: nil)
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let userLocation: CLLocation = locations[0] as CLLocation
        locationManager.stopUpdatingLocation()
        let location = CLLocationCoordinate2D(latitude: userLocation.coordinate.latitude, longitude: userLocation.coordinate.longitude)
        let span = MKCoordinateSpanMake(0.05, 0.05)
        let region = MKCoordinateRegion(center: location, span: span)
        mapView.setRegion(region, animated: true)
    }
}

