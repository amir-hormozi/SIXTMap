//
//  MapWorker.swift
//  SIXTMap
//
//  Created by Amir on 10/2/23.
//

import Foundation

protocol MapWorkerProtocol {
    func fetchCarsList() async throws -> [CarsListDecodableModel]
}

struct MapWorker {
    //MARK: Variable
    var networkManager: NetworkManagerProtocol
    
    //MARK: LifeCycle
    init(networkManager: NetworkManagerProtocol) {
        self.networkManager = networkManager
    }
}

extension MapWorker: MapWorkerProtocol {
    func fetchCarsList() async throws -> [CarsListDecodableModel] {
        let carsList: [CarsListDecodableModel] = try await networkManager.performRequest(apiConfig: MapAPIConfig())
        return carsList
    }
}
