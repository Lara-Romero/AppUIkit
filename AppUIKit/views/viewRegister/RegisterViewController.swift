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
        lbNameCustom.lbCustom10(text: "NOMBRE", textAlignment: .left)
        tfNameCustom.tfCuston(placeholder: "Escriba aquí")
        
        //Label y TextField apellidos
        lbSubnameCustom.lbCustom10(text: "APELLIDOS", textAlignment: .left)
        tfSubnameCustom.tfCuston(placeholder: "López Garriguez")
        
        //Label y PickerView del Dni
        lbDniPVCustom.lbCustom10(text: "IDENTIFICACIÓN", textAlignment: .left)
        
        //Label y TextField del número de Dni
        lbDniNumberCustom.lbCustom10(text: "NÚMERO", textAlignment: .left)
        tfDniNumberCustom.tfCuston(placeholder: "Escriba aquí")
        
        //Label y Date Picker
        lbDateCustom.lbCustom10(text: "FECHA NACIMIENTO", textAlignment: .left)
        
        //Botón Enviar
        btnSendCustom.bottomButton(title: "Enviar")
    }
}
