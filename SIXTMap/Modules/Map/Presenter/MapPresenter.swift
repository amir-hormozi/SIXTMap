//
//  MapPresenter.swift
//  SIXTMap
//
//  Created by Amir on 10/2/23.
//

import CoreLocation

fileprivate struct LocalConstants {
    static let mapDistanceValue: Int = 8000
}

protocol MapPresentationLogic {
    func presentCarsList(crasList: [MapModel.CarListPresentationModel]) async
    func setMapScale(locationDetail: MapModel.CarListPresentationModel?) async
    func presentError(error: String)
}

class MapPresenter {
    
    // MARK: Variable
    weak var viewController: MapDisplayLogic?
}

//MARK: PresentationLogic Extension
extension MapPresenter: MapPresentationLogic {
    func presentError(error: String) {
        viewController?.showError(errorMessage: error)
    }
    
    func setMapScale(locationDetail: MapModel.CarListPresentationModel?) async {
        guard let locationDetail = locationDetail else { return }
        guard let distanceMeter = CLLocationDistance(exactly: LocalConstants.mapDistanceValue) else { return }

        await viewController?.setMapScale(location: locationDetail, distanceMeter: distanceMeter)
    }
    
    func presentCarsList(crasList: [MapModel.CarListPresentationModel]) async {
        await viewController?.addPins(pins: crasList)
    }
}
