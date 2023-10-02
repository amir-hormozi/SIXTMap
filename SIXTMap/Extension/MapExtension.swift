//
//  MapExtension.swift
//  SIXTMap
//
//  Created by Amir on 10/2/23.
//

import MapKit

extension MKPointAnnotation {
    convenience init(pins: MapModel.CarListPresentationModel) {
        self.init()
        self.title = pins.title
        self.coordinate = CLLocationCoordinate2D(latitude: pins.lat, longitude: pins.long)
    }
}

extension MKMapView {
    func addAnnotations(pins: [MapModel.CarListPresentationModel]) {
        var annotationPins = pins.map { MKPointAnnotation(pins: $0) }
        self.addAnnotations(annotationPins)
    }
}
