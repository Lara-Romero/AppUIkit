
import Foundation
import UIKit

class LoginViewController: UIViewController {

    @IBOutlet var viewContent: UIView!
    @IBOutlet weak var imageCustom: UIImageView!
    @IBOutlet weak var tfNameCustom: UITextField!
    @IBOutlet weak var tfPaswordCustom: UITextField!
    @IBOutlet weak var lbForgotPwCustom: UILabel!
    @IBOutlet weak var lbAccountCustom: UILabel!
    @IBOutlet weak var lbRegisterCustom: UILabel!
    @IBOutlet weak var btnToAccess: UIButton!
    
//    let tap = UITapGestureRecognizer(target: self, action: #selector(DetailViewController.tapFunction))
//    lbForgotPwCustom.isUserInteractionEnabled = true
//    lbForgotPwCustom.addGestureRecognizer(tap)
//
//    @objc func tapFunction(sender:UITapGestureRecognizer) {
//        print("tap working")
//    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setStyles()
        //validPasswordTf()
        clicKeyboard()
        tfNameCustom.delegate = self
        tfPaswordCustom.delegate = self
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
    
    
    @IBAction func validateUser(_ sender: Any) {
    }
    
    @IBAction func validatePassword(_ sender: Any) {
    }
    
    @IBAction func access(_ sender: Any) {
    }
    
    
}

private extension LoginViewController {
    
    private func setStyles() {
        setGrandient()
     
        //Image
        imageCustom.image = UIImage(named: "Alten")
        
        //TextField nombre
        tfNameCustom.placeholder = "marisa.perez"
        tfNameCustom.keyboardType = .default
        
        //TextField contraseña
        tfPaswordCustom.placeholder = "Contraseña"
        
        //Label he olvidado contraseña
        //lbForgotPwCustom.text = "He olvidado mi contraseña"
        lbForgotPwCustom.textAlignment = .right
        lbForgotPwCustom.textColor = .white
        lbForgotPwCustom.font = UIFont(name: "OpenSans", size: 14.0)
        lbForgotPwCustom.attributedText = NSMutableAttributedString(string: "He olvidado mi contraseña", attributes: [NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue])
        
        //Label ¿Aun no tienes cuenta?
        lbRegisterCustom.text = "¿Aún no tienes cuenta?"
        lbRegisterCustom.textAlignment = .center
        lbRegisterCustom.textColor = .white
        lbRegisterCustom.font = UIFont(name: "OpenSans", size: 14.0)
        
        //Label Registrate
        //lbAccountCustom.text = "Regístrate"
        lbAccountCustom.textColor = .white
        lbAccountCustom.font = UIFont(name: "OpenSans", size: 14.0)
        lbAccountCustom.attributedText = NSMutableAttributedString(string: "Regístrate", attributes: [NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue])
        
        //Button Access
        btnToAccess.setTitle("Acceder", for: .normal)
        btnToAccess.setTitleColor(UIColor(red: 0.02, green: 0.24, blue: 0.4, alpha: 1), for: .normal)
        btnToAccess.backgroundColor = UIColor.white
        btnToAccess.layer.cornerRadius = 25
        btnToAccess.layer.borderWidth = 2
        btnToAccess.layer.borderColor = UIColor(red: 0.02, green: 0.24, blue: 0.4, alpha: 1).cgColor
        btnToAccess.layer.masksToBounds = true

    }
    
    private func setGrandient() {
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
    
    private func validUserTf() {
        if let user = tfNameCustom.text {
            if user.isValidUser() {
                let okAct = UIAlertAction(title: "OK", style: .default) { _ in
                    self.tfNameCustom.text = ""
                }
                Util.createAlert(title: "Aviso", message: "El nombre de usuario es correcto", actions: [okAct], presentVC: self)
            } else {
                let okAct = UIAlertAction(title: "OK", style: .default) { _ in
                    self.tfNameCustom.text = ""
                }
                Util.createAlert(title: "Aviso", message: "El nombre debe contener al menos una letra (mayúscula o minúscula), un número y tiene que tener al menos 4 caracteres", actions: [okAct], presentVC: self)
            }
        }
    }
    
    private func validPasswordTf() {
        if let password = tfPaswordCustom.text {
            if password.isValidPassword() {
                let okAct = UIAlertAction(title: "OK", style: .default) { _ in
                    self.tfNameCustom.text = ""
                }
                Util.createAlert(title: "Aviso", message: "La contraseña es correcta", actions: [okAct], presentVC: self)
            } else {
                let okAct = UIAlertAction(title: "OK", style: .default) { _ in
                    self.tfNameCustom.text = ""
                }
                Util.createAlert(title: "Aviso", message: "La contraseña debe contener al menos una letra (mayúscula o minúscula), un número, un caracter especial y debe tener al menos 6 caracteres", actions: [okAct], presentVC: self)
            }
        }
    }
    
//    private func validPasswordTf() {
//        if let password = tfPaswordCustom.text {
//            if isValidPassword(password: password) {
//                let okAct = UIAlertAction(title: "OK", style: .default) { _ in
//                    self.tfNameCustom.text = ""
//                }
//                Util.createAlert(title: "Aviso", message: "La contraseña es correcta", actions: [okAct], presentVC: self)
//            } else {
//                let okAct = UIAlertAction(title: "OK", style: .default) { _ in
//                    self.tfNameCustom.text = ""
//                }
//                Util.createAlert(title: "Aviso", message: "La contraseña debe contener letras y números", actions: [okAct], presentVC: self)
//            }
//        }
//    }
    
    private func clicKeyboard() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.dismissMyKeyboard(_:)))
        view.addGestureRecognizer(tap)
    }

    @objc func dismissMyKeyboard(_ sender: UITapGestureRecognizer? = nil) {
            view.endEditing(true)
    }
    
    
    
//    @objc func goToPasswordView() {
//        let passwordViewController = PasswordViewController()
//        self.navigationController.pushViewController(passwordViewController, animated: true)
//    }
    
    //    @objc func textFieldDidChange(_ textField: UITextField) {
    //        if let user = tfNameCustom.text, let password = tfPaswordCustom.text {
    //            let isUsernameValid = validUserTf(user)
    //            let isPasswordValid = validPasswordTf(password)
    //            acces.isEnabled = validUserTf && isPasswordValid
    //        } else {
    //            acces.isEnabled = false
    //        }
    //    }
    
}

extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
//        if let nextField = self.view.viewWithTag(textField.tag + 1) as? UITextField {
//            nextField.becomeFirstResponder()
//        } else {
//            textField.resignFirstResponder()
//        }
//        return false
//    }



