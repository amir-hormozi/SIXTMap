//
//  UIViewControllerExtension.swift
//  SIXTMap
//
//  Created by Amir Hormozi on 8/6/25.
//

import UIKit

extension UIViewController {
    func showAlert(withTitle title: String, withMessage message:String, messageButton: String = "OK") {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: messageButton, style: .default, handler: { action in
        })
        alert.addAction(ok)
        DispatchQueue.main.async(execute: {
            self.present(alert, animated: true)
        })
    }
}
