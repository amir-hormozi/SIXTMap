//
//  CarsListInteractor.swift
//  SIXTMap
//
//  Created by Amir on 10/10/23.
//


protocol CarsListBusinessLogic { }
protocol CarsListDataStore { }

class CarsListInteractor {
    
    // MARK: Variable
    var presenter: CarsListPresentationLogic?
    var worker: CarsListWorkerProtocol
    
    //MARK: LifeCycle
    init(worker: CarsListWorkerProtocol) {
        self.worker = worker
    }
}

//MARK: DataStore Extension
extension CarsListInteractor: CarsListDataStore { }

//MARK: BusinessLogic Extension
extension CarsListInteractor: CarsListBusinessLogic { }
