//
//  util.swift
//  AppUIKit
//
//  Created by lara.romero on 24/10/23.
//
import UIKit
import Foundation

struct Util {
    static func createAlert(title: String, message: String, actions: [UIAlertAction], presentVC: UIViewController) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        actions.forEach { alertController.addAction($0) }
        presentVC.present(alertController, animated: true, completion: nil)
    }
}
