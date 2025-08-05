//
//  MapViewController.swift
//  SIXTMap
//
//  Created by Amir on 10/2/23.
//

import UIKit
import MapKit

protocol MapDisplayLogic: AnyObject { 
    @MainActor func setMapScale(location: MapModel.CarListPresentationModel, distanceMeter: CLLocationDistance)
    @MainActor func addPins(pins: [MapModel.CarListPresentationModel])
    func showError(errorMessage: String)
}

class MapViewController: UIViewController {
    
    // MARK: Variable
    var interactor: MapBusinessLogic!
    var router: (MapRoutingLogic & MapDataPassing)?

    private lazy var mapView: MKMapView = {
        let map = MKMapView()
        map.overrideUserInterfaceStyle = .dark
        map.delegate = self
        map.mapType = .standard
        map.showsBuildings = false
        map.translatesAutoresizingMaskIntoConstraints = false
        return map
    }()
    
    // MARK: LifeCycle
    init() {
        super.init(nibName: nil, bundle: nil)
        setupVipStructure()
        interactor.fetchCarsList()
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
        let worker = MapWorker()
        let interactor = MapInteractor(worker: worker)
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

extension MapViewController: MapDisplayLogic {
    func showError(errorMessage: String) {
        showAlert(withTitle: "Error", withMessage: errorMessage)
    }
    
    func setMapScale(location: MapModel.CarListPresentationModel, distanceMeter: CLLocationDistance) {
        let region = MKCoordinateRegion( center: .init(latitude: location.lat, longitude: location.long), latitudinalMeters: distanceMeter, longitudinalMeters: distanceMeter)
        mapView.setRegion(mapView.regionThatFits(region), animated: true)
    }

    func addPins(pins: [MapModel.CarListPresentationModel]) {
        self.mapView.addAnnotations(pins: pins)
    }
}

extension MapViewController: MKMapViewDelegate {
    private func setupRenderer(overlay: MKOverlay) -> MKGradientPolylineRenderer {
        let renderer = MKGradientPolylineRenderer(overlay: overlay)
        
        renderer.setColors([
            UIColor(red: 0.02, green: 0.91, blue: 0.05, alpha: 1.0),
            UIColor(red: 1.0, green: 0.48, blue: 0.0, alpha: 1.0),
            UIColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 1.0),
        ], locations: [])
        renderer.lineCap = .round
        renderer.lineWidth = 3.0
        return renderer
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if annotation is MKUserLocation {
            return nil
        }
        
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: "custom")
        
        if annotationView == nil {
            //CREATE VIEW
            annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: "custom")
        } else {
            annotationView?.annotation = annotation
        }
        
        //SET CUSTOM ANNOTATION IMAGES
        annotationView?.image = UIImage(named: "location")
        
        return annotationView
    }
    
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        let renderer = setupRenderer(overlay: overlay)
        return renderer
    }
}

