//
//  ViewController.swift
//  MapApp
//
//  Created by Michael Young on 5/15/18.
//  Copyright © 2018 Michael Young. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
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
    }
    
    @IBAction func directionsPressed(_ sender: UIBarButtonItem) {
    }
}

