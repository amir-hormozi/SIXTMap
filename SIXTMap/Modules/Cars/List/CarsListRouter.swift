//
//  CarsListRouter.swift
//  SIXTMap
//
//  Created by Amir on 10/10/23.
//

protocol CarsListRoutingLogic { }

protocol CarsListDataPassing {
    var dataStore: CarsListDataStore? { get }
}

class CarsListRouter {
    
    // MARK: Variable
    weak var viewController: CarsListViewController?
    var dataStore: CarsListDataStore?
}

//MARK: RoutingLogic Extension
extension CarsListRouter: CarsListRoutingLogic { }

//MARK: DataPassing Extension
extension CarsListRouter: CarsListDataPassing { }
