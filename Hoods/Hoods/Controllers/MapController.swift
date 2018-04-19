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
    let layerIdentifier = "USA"
    
    //MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureMap()
    }
    
    //MARK: Map
    
    fileprivate func configureMap() {
        mapView.delegate = self
        mapView.setCenter(CLLocationCoordinate2D(latitude: 39.23225, longitude: -97.91015), animated: false)
        mapView.tintColor = .purple
        mapView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        mapView.allowsRotating = false
        mapView.showsHeading = true
        
        addMapTapGesture()
    }
    
    fileprivate func addMapTapGesture() {
        let mapTapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(mapTapped(_:)))
        mapView.addGestureRecognizer(mapTapGestureRecognizer)
    }
    
    @objc fileprivate func mapTapped(_ gesture: UITapGestureRecognizer) {
        let spot = gesture.location(in: mapView)
        let features = mapView.visibleFeatures(at: spot, styleLayerIdentifiers: Set([layerIdentifier]))
        
        if let feature = features.first, let country = feature.attribute(forKey: "name") as? String {
            changeOpacity(name: country)
        } else {
            changeOpacity(name: "")
        }
    }
    
    fileprivate func changeOpacity(name: String) {
        let layer = mapView.style?.layer(withIdentifier: layerIdentifier) as! MGLFillStyleLayer
        
        if name.count > 0 {
            layer.fillColor = MGLStyleValue(interpolationMode: .categorical, sourceStops: [name: MGLStyleValue<UIColor>(rawValue: .black)], attributeName: "name", options: [.defaultValue: MGLStyleValue<UIColor>(rawValue: .red)])
//            layer.fillOpacity = MGLStyleValue(interpolationMode: .categorical, sourceStops: [name: MGLStyleValue<NSNumber>(rawValue: 1)], attributeName: "name", options: [.defaultValue: MGLStyleValue<NSNumber>(rawValue: 0)])
        } else {
//            layer.fillOpacity = MGLStyleValue(rawValue: 1)
        }
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
