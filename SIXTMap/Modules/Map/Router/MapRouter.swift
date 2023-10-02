//
//  MapRouter.swift
//  SIXTMap
//
//  Created by Amir on 10/2/23.
//

protocol MapRoutingLogic { }

protocol MapDataPassing {
    var dataStore: MapDataStore? { get }
}

class MapRouter: MapRoutingLogic, MapDataPassing {
    
    // MARK: Variable
    weak var viewController: MapViewController?
    var dataStore: MapDataStore?

}
