//
//  AlertViewHelper.swift
//  Shawermeh
//
//  Created by Rami on 2/14/20.
//  Copyright © 2020 Rami. All rights reserved.
//

import UIKit

class AlertViewHelper {
    class func showAlertWithOneButton(with title: String?,
                                      message: String?,
                                      buttonTitle: String?,
                                      confirmButtonAction: ((UIAlertAction) -> Void)? = nil,
                                      on viewController: UIViewController) {
        
        let alertView = UIAlertController(title: title,
                                          message: message,
                                          preferredStyle: .alert)
        
        let actionButton = UIAlertAction(title: buttonTitle,
                                         style: .default,
                                         handler: nil)
        
        alertView.addAction(actionButton)
        
        viewController.present(alertView, animated: true)
    }
    
    class func showAlertWithTwoButtons(with title: String?,
                                 message: String?,
                                 firstButtonTitle: String?,
                                 secondButtonTitle: String?,
                                 confirmButtonAction: ((UIAlertAction) -> Void)? = nil,
                                 on viewController: UIViewController) {
        
        let alertView = UIAlertController(title: title,
                                          message: message,
                                          preferredStyle: .alert)
        
        let firstButton = UIAlertAction(title: firstButtonTitle,
                                        style: .default,
                                        handler: confirmButtonAction)
        let secondButton = UIAlertAction(title: secondButtonTitle,
                                         style: .destructive)
        
        alertView.addAction(firstButton)
        alertView.addAction(secondButton)
        
        viewController.present(alertView, animated: true)
    }
}
