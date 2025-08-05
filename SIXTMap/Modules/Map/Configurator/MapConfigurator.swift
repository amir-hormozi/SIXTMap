//
//  MapConfigurator.swift
//  SIXTMap
//
//  Created by Amir Hormozi on 8/6/25.
//

import UIKit

final class MapConfigurator {
    @discardableResult
    static func configure() -> MapViewController {
        let viewController = MapViewController()
        let worker = MapWorker(networkManager: NetworkManager())
        let interactor = MapInteractor(worker: worker)
        let presenter = MapPresenter()
        let router = MapRouter()

        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor

        return viewController
    }
}
