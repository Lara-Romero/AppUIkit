
import Foundation
import UIKit

class LoginViewController: KeyboardHandlingBaseVC {

    @IBOutlet var viewContent: UIView!
    @IBOutlet weak var imageCustom: UIImageView!
    @IBOutlet weak var tfNameCustom: UITextField!
    @IBOutlet weak var tfPaswordCustom: UITextField!
    @IBOutlet weak var lbForgotPwCustom: UILabel!
    @IBOutlet weak var lbAccountCustom: UILabel!
    @IBOutlet weak var lbRegisterCustom: UILabel!
    @IBOutlet weak var btnToAccess: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setStyles()
        tfNameCustom.delegate = self
        tfPaswordCustom.delegate = self
        
        //Configuramos el label para que al hacer un tap vaya a la otra pantalla
        let tap = UITapGestureRecognizer(target: self, action: #selector(labelTapped))
        lbForgotPwCustom.isUserInteractionEnabled = true
        lbForgotPwCustom.addGestureRecognizer(tap)
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
        validUserTf()
    }
    
    @IBAction func validatePassword(_ sender: Any) {
        validPasswordTf()
    }
    
    //Para configurarlo y que vaya a la pantalla de registro cuando la tengamos
    @IBAction func access(_ sender: Any) {
        emptyFields()
    }
}

private extension LoginViewController {
    
    private func setStyles() {
        setGrandient()
        
        //Image
        imageCustom.image = UIImage(named: "Alten")
        
        //TextField nombre
        tfNameCustom.tfCuston(placeholder: "marisa.perez")
        
        //TextField contraseña
        tfPaswordCustom.tfCuston(placeholder: "Contraseña")
        
        //Label he olvidado contraseña
        lbForgotPwCustom.lbCustom(text: "He olvidado mi contraseño", textAlignment: .right)
        lbForgotPwCustom.attributedText = NSMutableAttributedString(string: "He olvidado mi contraseña", attributes: [NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue])
        
        //Label ¿Aun no tienes cuenta?
        lbRegisterCustom.lbCustom(text: "¿Aún no tienes cuenta?", textAlignment: .center)
        
        //Label Regístrate
        lbAccountCustom.lbCustom(text: "Regístrate", textAlignment: .center)
        lbAccountCustom.attributedText = NSMutableAttributedString(string: "Regístrate", attributes: [NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue])
        
        //Button Access
        btnToAccess.bottomButton(title: "Acceder")
    }
    
    private func validUserTf() {
        if let user = tfNameCustom.text {
            if user.isValidUser() {
                print("Usuario válido")
            } else {
                let okAct = UIAlertAction(title: "OK", style: .default) { _ in
                    self.tfNameCustom.text = ""
                }
                Util.createAlert(title: "Aviso", message: "Nombre de usuario incorrecto: Debe tener al menos 6 caracteres", actions: [okAct], presentVC: self)
            }
        }
    }
    
    private func validPasswordTf() {
        if let password = tfPaswordCustom.text {
            if password.isValidPassword() {
                print("Contraseña correcta")
            } else {
                let okAct = UIAlertAction(title: "OK", style: .default) { _ in
                    self.tfNameCustom.text = ""
                }
                Util.createAlert(title: "Aviso", message: "La contraseña debe contener al menos una letra (mayúscula o minúscula), un número, un caracter especial y debe tener al menos 8 caracteres", actions: [okAct], presentVC: self)
            }
        }
    }
    
    // Vaciamos los campos después de darle al botón y creamos la alerta
    func emptyFields() {
        if btnToAccess.isEnabled {
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            Util.createAlert(title: "Acceso", message: "Usuario y contraseña correctos", actions: [okAction], presentVC: self)
        }
        tfNameCustom.text = ""
        tfPaswordCustom.text = ""
    }
    
    //Hacemos navegar el label a la pantalla PAssword
    @objc func labelTapped() {
            let secondViewController = PasswordViewController()
            navigationController?.pushViewController(secondViewController, animated: true)
        }
}

extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}






