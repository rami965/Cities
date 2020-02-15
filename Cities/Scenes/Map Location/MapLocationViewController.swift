//
//  MapLocationViewController.swift
//  Cities
//
//  Created by Rami on 2/15/20.
//  Copyright © 2020 Rami Saeed. All rights reserved.
//

import UIKit
import MapKit

class MapLocationViewController: BaseViewController {
    
    @IBOutlet weak private var mapView: MKMapView!
    
    private let annotation = MKPointAnnotation()
    
    var presenter: MapLocationPresenter?

    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        addMapAnnotation()
    }
    
    private func configureView() {
        navigationItem.largeTitleDisplayMode = .never
    }

    private func addMapAnnotation() {
        guard let coordinate = presenter?.getCLLocationCoordinates()
            else { return }
        annotation.coordinate = coordinate
        mapView.addAnnotation(annotation)
    }
    
    func setPresenter(_ presenter: MapLocationPresenter) {
        self.presenter = presenter
    }
}

extension MapLocationViewController: MapLocationViewDelegate {
    
}
