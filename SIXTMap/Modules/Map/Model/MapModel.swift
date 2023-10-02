//
//  MapModel.swift
//  SIXTMap
//
//  Created by Amir on 10/2/23.
//

struct MapModel {
    
    struct CarListPresentationModel {
        var title: String
        var lat: Double
        var long: Double
        var image: String
        init(dtoModel: CarsListDecodableModel) {
            self.title = dtoModel.name ?? ""
            self.lat = dtoModel.latitude ?? 0.0
            self.long = dtoModel.longitude ?? 0.0
            self.image = ""
        }
        
    }
}

