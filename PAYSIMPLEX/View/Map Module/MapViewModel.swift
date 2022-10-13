//
//  MapViewModel.swift
//  PAYSIMPLEX
//
//  Created by cis on 12/10/22.
//

import SwiftUI
import Mapbox

struct MapboxMap: UIViewRepresentable {
    
    var locations = [CLLocationCoordinate2D]()
    
    private let mapView: MGLMapView = MGLMapView(frame: .zero, styleURL: MGLStyle.lightStyleURL)
    
    
    func makeUIView(context: Context) -> MGLMapView {
        mapView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        mapView.delegate = context.coordinator
        mapView.userTrackingMode = .followWithHeading
        mapView.showsUserLocation = true
        mapView.showsUserHeadingIndicator = true
        
        return mapView
    }
    
    func updateUIView(_ uiView: MGLMapView, context: Context) {
         updateAnnotations()
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator()
    }
    
    private func updateAnnotations() {
        if let currentAnnotations = mapView.annotations {
            mapView.removeAnnotations(currentAnnotations)
        }
        mapView.addAnnotations(locations.map({ (coord) -> MGLPointAnnotation in
            let annotation = MGLPointAnnotation()
            annotation.coordinate = coord
            return annotation
        }))
    }
    
    
    class Coordinator: NSObject, MGLMapViewDelegate {
        
        func mapView(_ mapView: MGLMapView, viewFor annotation: MGLAnnotation) -> MGLAnnotationView? {
            return nil
        }
        
        func mapView(_ mapView: MGLMapView, annotationCanShowCallout annotation: MGLAnnotation) -> Bool {
            return true
        }
        
        func mapView(_ mapView: MGLMapView, didUpdate userLocation: MGLUserLocation?) {
         //   print("User Location: \(String(describing: userLocation))")
//            guard let coord = userLocation?.coordinate else { return }
//            mapView.setCenter(coord, animated: true)
//            mapView.zoomLevel = 12
        }
        
    }
}


