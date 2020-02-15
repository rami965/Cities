//
//  CitiesTableViewCell.swift
//  Cities
//
//  Created by Rami on 2/14/20.
//  Copyright © 2020 Rami Saeed. All rights reserved.
//

import UIKit
import Kingfisher

class CitiesTableViewCell: UITableViewCell {
    
    // MARK: - Outlets
    
    @IBOutlet weak private var cityNameLabel: UILabel!
    @IBOutlet weak private var countryNameLabel: UILabel!
    @IBOutlet weak private var cityLocationImageView: UIImageView!
    
    // MARK: - Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureCellView()
    }
    
    // MARK: - Private Functions
    
    private func configureCellView() {
        selectionStyle = .none
        
        cityNameLabel.numberOfLines = 0
        cityNameLabel.lineBreakMode = .byWordWrapping
        cityNameLabel.textColor = .darkGray
        cityNameLabel.font = UIFont.systemFont(ofSize: 20,
                                               weight: .bold)
        
        countryNameLabel.numberOfLines = 0
        countryNameLabel.lineBreakMode = .byWordWrapping
        cityNameLabel.textColor = .lightGray
        countryNameLabel.font = UIFont.systemFont(ofSize: 18,
                                                  weight: .semibold)
        
        cityLocationImageView.clipsToBounds = true
        cityLocationImageView.addCornerRadius(radius: cityLocationImageView.frame.width / 2)
    }
}

// MARK: - CitiesCellViewDelegate
extension CitiesTableViewCell: CitiesCellViewDelegate {
    func displayCityName(name: String?) {
        cityNameLabel.text = name
    }
    
    func displayCountryName(name: String?) {
        countryNameLabel.text = name
    }
    
    func displayLocationImage(with imageURL: URL?) {
        cityLocationImageView.kf.setImage(with: imageURL)
    }
}
