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
    
    var presenter: MapLocationPresenter?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    
    func setPresenter(_ presenter: MapLocationPresenter) {
        self.presenter = presenter
    }
}

extension MapLocationViewController: MapLocationViewDelegate {
    
}
