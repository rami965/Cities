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
    
    // MARK: - Outlets
    
    @IBOutlet weak private var mapView: MKMapView!
    
    // MARK: - Private Properties
    
    private let annotation = MKPointAnnotation()
    private let spanZoomLevel = 0.5
    
    // MARK: - Public Properties
    
    var presenter: MapLocationPresenter?

    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        addMapAnnotation()
    }
    
    // MARK: - Private Functions
    
    private func configureView() {
        navigationItem.largeTitleDisplayMode = .never
    }

    private func addMapAnnotation() {
        guard let coordinate = presenter?.getCLLocationCoordinates()
            else { return }
        annotation.coordinate = coordinate
        mapView.addAnnotation(annotation)
        mapView.setCenter(coordinate, animated: true)
        
        // MARK: - Optional call this function for specified zoom level
//        zoom(coordinate: coordinate)
    }
    
    private func zoom(coordinate: CLLocationCoordinate2D) {
        let span = MKCoordinateSpan(latitudeDelta: spanZoomLevel,
                                    longitudeDelta: spanZoomLevel)
        let cityRegion = MKCoordinateRegion(center: coordinate,
                                            span: span)
        mapView.setRegion(cityRegion, animated: true)
    }
    
    // MARK: - Public Functions
    
    func setPresenter(_ presenter: MapLocationPresenter) {
        self.presenter = presenter
    }
}

// MARK: - MapLocationViewDelegate
extension MapLocationViewController: MapLocationViewDelegate {
    
}
