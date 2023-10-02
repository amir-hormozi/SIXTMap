//
//  CarsListDecodableModel.swift
//  SIXTMap
//
//  Created by Amir on 10/2/23.
//

struct CarsListDecodableModel: Decodable {
    let id, modelIdentifier, modelName, name: String?
    let make, group: String?
    let color, series: String?
    let fuelType: String?
    let fuelLevel: Double?
    let transmission: String?
    let licensePlate: String?
    let latitude, longitude: Double?
    let innerCleanliness: String?
    let carImageURL: String?
}
