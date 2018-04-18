//
//  MapController.swift
//  Hoods
//
//  Created by Andrew Carvajal on 3/31/18.
//  Copyright © 2018 Hoods. All rights reserved.
//

import UIKit
import Mapbox

class MapController: UIViewController {
    
    //MARK: Properties
    
    @IBOutlet var mapView: MGLMapViewWorkaround!
    
    //MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureMap()
    }
    
    //MARK: Map
    
    fileprivate func configureMap() {
        mapView.delegate = self
        mapView.tintColor = .purple
        mapView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        mapView.allowsRotating = false
        mapView.showsHeading = true
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        print("didReceiveMemoryWarning()")
    }
}

extension MapController: MGLMapViewDelegate {
    func mapViewDidFinishLoadingMap(_ mapView: MGLMapView) {
        print("mapViewDidFinishLoadingMap(mapView:MGLMapView)")
    }
    
    func mapView(_ mapView: MGLMapView, didFinishLoading style: MGLStyle) {
        print("mapView(mapView: didFinishLoading style: MGLStyle)")
    }
}
