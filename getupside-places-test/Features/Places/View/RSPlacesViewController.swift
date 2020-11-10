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
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    var repository = RSPlacesRepository()
    
    //MARK: Properties
    lazy var viewModel: RSPlacesViewModelProtocol = {
        let useCase = RSPlacesUseCase()
        let viewModel = RSPlacesViewModel(useCase: useCase)
        return viewModel
    }()
    
    lazy var router: NavigationRouter = {
       return RSPlacesRouter()
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
        
        _ = viewModel.selectedPlace.dropFirst(1).observeNext { [weak self] selectedPlace in
            guard let self = self else { return }
            self.router.route(to: RSPlacesRoutes.placesDetails, from: self, with: selectedPlace)
        }
        
        _ = viewModel.shouldShowSpinner.dropFirst(1).observeNext { [weak self] shouldShow in
            guard let self = self else { return }
            self.spinner.isHidden = !shouldShow
            shouldShow ? self.spinner.startAnimating() : self.spinner.stopAnimating()
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
        mapView.delegate = viewModel
        mapView.isMyLocationEnabled = true
    }
}

//MARK: Table view
private extension RSPlacesViewController {
    func setupTableView() {
        // This registration can be moved to extension but as we use this only in one place I leave it here
        tableView.delegate = viewModel
        tableView.register(UINib(nibName: String(describing: RSPlaceTableViewCell.self), bundle: Bundle.main), forCellReuseIdentifier: String(describing: RSPlaceTableViewCell.self))
        tableView.estimatedRowHeight = 95
        tableView.rowHeight = UITableView.automaticDimension
    }
}

// Util for clearing local storage for shake gesture. Used only for testing.
extension RSPlacesViewController {
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            let clearAction = UIAlertAction(title: "Clear", style: .destructive) { [weak self] _ in
                guard let self = self else { return }
                self.repository.deleteAll()
            }
            
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            let alertController = UIAlertController(title: "Clear local storage?", message: "", preferredStyle: .alert)
            alertController.addAction(clearAction)
            alertController.addAction(cancelAction)
            present(alertController, animated: true, completion: nil)
            
        }
    }
}
