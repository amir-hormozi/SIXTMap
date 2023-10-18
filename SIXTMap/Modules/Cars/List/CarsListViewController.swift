//
//  CarsListViewController.swift
//  SIXTMap
//
//  Created by Amir on 10/10/23.
//

import UIKit

protocol CarsListDisplayLogic: AnyObject { }

class CarsListViewController: UIViewController {
    
    typealias DataSource = UICollectionViewDiffableDataSource<CarsListModel.Sections, CarsListModel.CollectionModel>
    typealias SnapShot = NSDiffableDataSourceSnapshot<CarsListModel.Sections, CarsListModel.CollectionModel>
    
    // MARK: Variable
    var interactor: CarsListBusinessLogic!
    var router: (CarsListRoutingLogic & CarsListDataPassing)?
    
    lazy var snapShot: SnapShot = SnapShot()
    lazy var dataSource: DataSource = makeDataSource()
    
    lazy var collection: UICollectionView = {
       let collection = UICollectionView()
        collection.register(CarCell.self, forCellWithReuseIdentifier: "carsListIdentifier")
        collection.translatesAutoresizingMaskIntoConstraints = false
        return collection
    }()

    // MARK: LifeCycle
    init() {
        super.init(nibName: nil, bundle: nil)
        setupVipStructure()
    }
    
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Function
    private func setupVipStructure() {
        let viewController = self
        var presenter = CarsListPresenter()
        var router = CarsListRouter()
        let worker = CarsListWorker()
        let interactor = CarsListInteractor(worker: worker)
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
    
    private func makeDataSource() -> DataSource {
        return DataSource(collectionView: self.collection) { collectionView, indexPath, itemIdentifier in
            switch itemIdentifier {
            case .cars(let carsList):
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "carsListIdentifier", for: indexPath) as? CarCell else { return UICollectionViewCell() }
                cell.item = carsList
                return cell
            }
        }
    }
}

//MARK: DisplayLogic Extension
extension CarsListViewController: CarsListDisplayLogic { }
