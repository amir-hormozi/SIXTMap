//
//  CarsListModel.swift
//  SIXTMap
//
//  Created by Amir on 10/10/23.
//

struct CarsListModel { 
    enum Sections: Int, Hashable, CaseIterable{
        case cars = 0
    }
    
    enum CollectionModel: Hashable {
        case cars(CarsListSectionModel)
    }
    
    struct CarsListSectionModel: Hashable {
        let id, name: String?
        let color, series: String?
        let carImageURL: String?
    }
    
    struct CarsListBusinessModel {
        let id, name: String?
        let color, series: String?
        let fuelType: String?
        let fuelLevel: Double?
        let transmission: String?
        let licensePlate: String?
        let latitude, longitude: Double?
        let innerCleanliness: String?
        let carImageURL: String?
    }

    
    
}

