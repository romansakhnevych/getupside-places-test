//
//  RSPlacesViewController.swift
//  getupside-places-test
//
//  Created by Roman Sakhnevych on 06.11.2020.
//

import MapKit
import GoogleMaps

final class RSPlacesViewController: UIViewController {

    //MARK: IBOutlets
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var mapView: GMSMapView!
    
    //MARK: Properties
    lazy var viewModel: RSPlacesViewModelProtocol = {
        let useCase = RSPlacesUseCase()
        let viewModel = RSPlacesViewModel(useCase: useCase)
        return viewModel
    }()
        
    //MARK: View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
        setupUI()
        viewModel.loaded()
    }

    //MARK: Binding
    private func bindViewModel() {
        _ = viewModel.camera.dropFirst(1).observeNext { [weak self] camera in
            guard let self = self else { return }
            self.mapView.camera = camera
        }
        
        _ = viewModel.placesMarkers.dropFirst(1).observeNext { [weak self] markers in
            guard let self = self else { return }
            markers.collection.forEach { $0.map = self.mapView }
        }
        
        _ = viewModel.places.dropFirst(1).bind(to: tableView, cellType: RSPlaceTableViewCell.self) { cell, place in
            cell.nameLabel.text = place.placeName
            cell.addressLabel.text = place.shortAddress
        }

    }
}

//MARK: UI Setup
private extension RSPlacesViewController {
    func setupUI() {
        setupMapView()
        setupTableView()
    }
}

//MARK: Map view
private extension RSPlacesViewController {
    func setupMapView() {
        mapView.isMyLocationEnabled = true
    }
}

//MARK: Table view
private extension RSPlacesViewController {
    func setupTableView() {
        // This registration can be moved to extension but as we use this only in one place I leave it here
        tableView.register(UINib(nibName: String(describing: RSPlaceTableViewCell.self), bundle: Bundle.main), forCellReuseIdentifier: String(describing: RSPlaceTableViewCell.self))
        tableView.estimatedRowHeight = 95
        tableView.rowHeight = UITableView.automaticDimension
    }
}
