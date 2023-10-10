//
//  MapInteractor.swift
//  SIXTMap
//
//  Created by Amir on 10/2/23.
//


protocol MapBusinessLogic {
    func fetchCarsList()
}

protocol MapDataStore { }

class MapInteractor {
    
    // MARK: Variable
    var presenter: MapPresentationLogic?
    var worker: MapWorkerProtocol
    
    init(worker: MapWorkerProtocol) {
        self.worker = worker
    }
    
    private func castDTOModelToPresentationModel(dtoModel: [CarsListDecodableModel]) -> [MapModel.CarListPresentationModel] {
        dtoModel.map { MapModel.CarListPresentationModel(dtoModel: $0)}
    }
}

extension MapInteractor: MapBusinessLogic {
    func fetchCarsList() {
        Task {
            do {
                let carsListDecodableModel = try await worker.fetchCarsList()
                let presentationModel = castDTOModelToPresentationModel(dtoModel: carsListDecodableModel)
                await presenter?.setMapScale(locationDetail: presentationModel.first)
                await presenter?.presentCarsList(crasList: presentationModel)
            } catch (let error) {
                print(error)
            }
        }
    }
}

extension MapInteractor: MapDataStore {
    
}
