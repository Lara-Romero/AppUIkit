//
//  Desings.swift
//  AppUIKit
//
//  Created by lara.romero on 25/10/23.
//
import UIKit
import Foundation

public extension UIViewController {
    func setGrandient() {
        // Background gradient
        let color1 = UIColor(red: 0.0/238.0, green: 23.0/238.0, blue: 41.0/238.0, alpha: 1.0)
        let color2 = UIColor(red: 24.0/216.0, green: 98.0/216.0, blue: 155.0/216.0, alpha: 1.0)
        let gradientLayer = CAGradientLayer()
        
        // Actualiza el marco de la capa del gradiente en viewDidLayoutSubviews
        gradientLayer.frame = self.view.bounds
        gradientLayer.colors = [color1.cgColor, color2.cgColor]
        gradientLayer.startPoint = CGPoint(x: 1.0, y: 0.0)
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
        
        if gradientLayer.superlayer == nil {
            self.view.layer.insertSublayer(gradientLayer, at: 0)
        }
    }
}