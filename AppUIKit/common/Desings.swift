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

public extension UIButton {
    func bottomButton(title: String) {
        setTitle(title, for: .normal)
        setTitleColor(UIColor(red: 0.02, green: 0.24, blue: 0.4, alpha: 1), for: .normal)
        backgroundColor = UIColor.white
        layer.cornerRadius = 25
        layer.borderWidth = 2
        layer.borderColor = UIColor(red: 0.02, green: 0.24, blue: 0.4, alpha: 1).cgColor
        layer.masksToBounds = true
    }
}

public extension UILabel {
    func lbCustom14(text: String, textAlignment: NSTextAlignment) {
        self.text = text
        self.textAlignment = textAlignment
        
        textColor = .white
        font = UIFont(name: "OpenSans", size: 14.0)
    }
    
    func lbCustom10(text: String, textAlignment: NSTextAlignment) {
        self.text = text
        self.textAlignment = textAlignment
        
        textColor = UIColor(red: 0.192, green: 0.125, blue: 0.125, alpha: 0.58)
        font = UIFont(name: "OpenSans", size: 10.0)
    }
}

public extension UITextField {
    func tfCuston(placeholder: String) {
        self.placeholder = placeholder
        
        keyboardType = .default
        backgroundColor = UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 0.4)
    }
}

