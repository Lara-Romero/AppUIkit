//
//  RegisterViewController.swift
//  AppUIKit
//
//  Created by lara.romero on 26/10/23.
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet weak var lbNameCustom: UILabel!
    @IBOutlet weak var tfNameCustom: UITextField!
    @IBOutlet weak var lbSubnameCustom: UILabel!
    @IBOutlet weak var tfSubnameCustom: UITextField!
    @IBOutlet weak var lbDniPVCustom: UILabel!
    @IBOutlet weak var pvDniCustom: UIPickerView!
    @IBOutlet weak var lbDniNumberCustom: UILabel!
    @IBOutlet weak var tfDniNumberCustom: UITextField!
    @IBOutlet weak var lbDateCustom: UILabel!
    @IBOutlet weak var dpDateCustom: UIDatePicker!
    @IBOutlet weak var btnSendCustom: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setStyles()

    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        if let gradientLayer = self.view.layer.sublayers?.first as? CAGradientLayer {
            gradientLayer.frame = self.view.bounds
        }
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        .lightContent
    }
    
    deinit {
        
    }
}

private extension RegisterViewController {
    private func setStyles() {
        setGrandient()
        
        //Label y TextField del nombre
        lbNameCustom.attributedText = NSAttributedString(string: "NOMBRE", attributes: [NSAttributedString.Key.kern: 0.2])
        lbNameCustom.lbCustom(text: "NOMBRE", textAlignment: .center)
        
        tfNameCustom.tfCuston(placeholder: "Escriba aquí")
        
        //
        lbSubnameCustom.lbCustom(text: "APELLIDOS", textAlignment: .center)
        
        tfSubnameCustom.tfCuston(placeholder: "López Garriguez")
        
        lbDniPVCustom.lbCustom(text: "IDENTIFICACIÓN", textAlignment: .center)
        
        
        
        btnSendCustom.bottomButton(title: "Enviar")
    }
}
