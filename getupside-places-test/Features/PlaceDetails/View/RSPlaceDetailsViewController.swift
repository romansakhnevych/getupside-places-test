//
//  RSPlaceDetailsViewController.swift
//  getupside-places-test
//
//  Created by Roman Sakhnevych on 10.11.2020.
//

import UIKit

class RSPlaceDetailsViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var streetLabel: UILabel!
    @IBOutlet weak var buildingLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var regionLabel: UILabel!
    @IBOutlet weak var postalLabel: UILabel!
    
    var place: RSPlace?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = place?.placeName
        streetLabel.text = "\(place?.streetType ?? "") \(place?.streetName ?? "" )"
        buildingLabel.text = place?.buildingNumber
        cityLabel.text = place?.city
        countryLabel.text = place?.country
        regionLabel.text = place?.region
        postalLabel.text = place?.postal
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)

    }
    

}
