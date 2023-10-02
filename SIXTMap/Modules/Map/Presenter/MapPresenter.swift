//
//  MapPresenter.swift
//  SIXTMap
//
//  Created by Amir on 10/2/23.
//

protocol MapPresentationLogic {
    func presentCarsList(crasList: [MapModel.CarListPresentationModel])
}

class MapPresenter {
    
    // MARK: Variable
    weak var viewController: MapDisplayLogic?
}

extension MapPresenter: MapPresentationLogic {
    func presentCarsList(crasList: [MapModel.CarListPresentationModel]) {
        viewController?.addPins(pins: crasList)
    }
}
