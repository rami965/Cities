//
//  BaseViewController.swift
//  Cities
//
//  Created by Rami on 2/14/20.
//  Copyright © 2020 Rami Saeed. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

class BaseViewController: UIViewController, NVActivityIndicatorViewable {

    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // MARK: - Public Functions
    
    func showLoaderView() {
        startAnimating(CGSize(width: 100, height: 100),
                       type: .lineScale,
                       color: .white,
                       padding: 20,
                       backgroundColor: .lightGray)
    }
    
    func hideLoaderView() {
        stopAnimating()
    }
}
