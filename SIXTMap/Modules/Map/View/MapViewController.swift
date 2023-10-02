//
//  MapViewController.swift
//  SIXTMap
//
//  Created by Amir on 10/2/23.
//

import UIKit
import MapKit

protocol MapDisplayLogic: AnyObject { }

class MapViewController: UIViewController, MapDisplayLogic {
    
    // MARK: Variable
    var interactor: MapBusinessLogic!
    var router: (MapRoutingLogic & MapDataPassing)?

    private lazy var mapView: MKMapView = {
        let map = MKMapView()
        map.overrideUserInterfaceStyle = .dark
        map.delegate = self
        map.translatesAutoresizingMaskIntoConstraints = false
        return map
    }()
    
    // MARK: LifeCycle
    init() {
        super.init(nibName: nil, bundle: nil)
        setupVipStructure()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addView()
        setupConstraints()
    }

    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Function
    private func setupVipStructure() {
        let viewController = self
        let presenter = MapPresenter()
        let router = MapRouter()
        let interactor = MapInteractor()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
    
    private func addView() {
        view.addSubview(mapView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            mapView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            mapView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mapView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mapView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension MapViewController: MKMapViewDelegate {
    
}
