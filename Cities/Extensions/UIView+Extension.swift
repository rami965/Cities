//
//  UIView+Extension.swift
//  Cities
//
//  Created by Rami on 2/14/20.
//  Copyright © 2020 Rami Saeed. All rights reserved.
//

import UIKit

extension UIView {
    func addCornerRadius(radius: CGFloat,
                         masksToBounds: Bool = true,
                         maskedCorners: CACornerMask? = nil) {
        layer.masksToBounds = masksToBounds
        layer.cornerRadius = radius
        
        guard let maskedCorners = maskedCorners else { return }
        layer.maskedCorners = maskedCorners
    }
    
    func addShadow(with color: UIColor?,
                   offset: CGSize = CGSize.zero,
                   radius: CGFloat = 0.0,
                   opacity: Float = 1.0) {
        layer.shadowColor = color?.cgColor
        layer.shadowOffset = offset
        layer.shadowRadius = radius
        layer.shadowOpacity = opacity
    }
}
