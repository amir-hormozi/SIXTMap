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
    
}

extension MapWorker: MapWorkerProtocol {
    func fetchCarsList() async throws -> [CarsListDecodableModel] {
        let carsList: [CarsListDecodableModel] = try await NetworkManager().performRequest(apiConfig: MapAPIConfig())
        return carsList
    }
}
