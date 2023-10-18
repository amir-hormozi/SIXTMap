//
//  CarsListPresenter.swift
//  SIXTMap
//
//  Created by Amir on 10/10/23.
//

protocol CarsListPresentationLogic { }

class CarsListPresenter {
    
    // MARK: Variable
    weak var viewController: CarsListDisplayLogic?
}

// MARK: PresentationLogic Extension
extension CarsListPresenter: CarsListPresentationLogic { }
