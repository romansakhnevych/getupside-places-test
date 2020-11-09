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
    
    //MARK: Init
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        bindViewModel()
    }
 
    //MARK: View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.loaded()
    }

    //MARK: Binding
    private func bindViewModel() {
        _ = viewModel.camera.dropFirst(1).observeNext { [weak self] camera in
            guard let self = self else { return }
            self.mapView.camera = camera
        }
    }
}

//MARK: UI Setup
extension RSPlacesViewController {
    func setupUI() {
        
    }
}

//MARK: Map view
extension RSPlacesViewController {
    func setupMapView() {
        mapView.isMyLocationEnabled = true
    }
}
