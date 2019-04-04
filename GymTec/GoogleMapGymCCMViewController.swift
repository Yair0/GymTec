//
//  GoogleMapGymCCMViewController.swift
//  GymTec
//
//  Created by cdt307 on 3/29/19.
//  Copyright © 2019 Yair Pimentel. All rights reserved.
//

import MapKit
import CoreLocation
import UIKit

class GoogleMapGymCCMViewController: UIViewController, CLLocationManagerDelegate{

    @IBOutlet weak var mapa: MKMapView!
    let locationManager = CLLocationManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.distanceFilter = 1000.0
        locationManager.requestWhenInUseAuthorization()
        
        
        mapa.mapType=MKMapType.standard
        let cl=CLLocationCoordinate2DMake(19.283656, -99.133525)
        mapa.region=MKCoordinateRegion(center: cl, latitudinalMeters: 1500, longitudinalMeters: 1500)
        /* //esta es otra forma de definir la región de un mapa
         let origen=CLLocationCoordinate2DMake(0.0, 0.0)
         let delta=CLLocationDegrees(0.01)
         let span=MKCoordinateSpanMake(delta, delta)
         let region=MKCoordinateRegionMake(cl, span)
         mapa.setRegion(region, animated: true)
         */
        var punto = CLLocationCoordinate2D()
        punto.latitude = 19.283656
        punto.longitude = -99.133525
        let pin = MKPointAnnotation()
        pin.coordinate = punto
        pin.title = "Gymnasio CCM"
        pin.subtitle = "Let's lift!"
        mapa.addAnnotation(pin)
        
        
        mapa.showsCompass=true
        mapa.showsScale=true
        mapa.showsTraffic=true
        mapa.isZoomEnabled=true
        
    }
    
    func locationManager(_ manager: CLLocationManager,
                         didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedWhenInUse{
            locationManager.startUpdatingLocation()
            mapa.showsUserLocation = true
        } else {
            locationManager.stopUpdatingLocation()
            mapa.showsUserLocation = false
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
