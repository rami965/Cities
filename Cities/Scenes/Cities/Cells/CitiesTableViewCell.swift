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
    
    @IBOutlet weak private var cityNameLabel: UILabel!
    @IBOutlet weak private var countryNameLabel: UILabel!
    @IBOutlet weak private var cityLocationImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureCellView()
    }
    
    private func configureCellView() {
        selectionStyle = .none
        
        cityNameLabel.numberOfLines = 0
        cityNameLabel.lineBreakMode = .byWordWrapping
        
        countryNameLabel.numberOfLines = 0
        countryNameLabel.lineBreakMode = .byWordWrapping
        
        cityLocationImageView.clipsToBounds = true
        cityLocationImageView.addCornerRadius(radius: cityLocationImageView.frame.width / 2)
    }
}

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
