//
//  MapInteractor.swift
//  SIXTMap
//
//  Created by Amir on 10/2/23.
//


protocol MapBusinessLogic { }

protocol MapDataStore { }

class MapInteractor: MapDataStore, MapBusinessLogic {
    
    // MARK: Variable
    var presenter: MapPresentationLogic?
}
