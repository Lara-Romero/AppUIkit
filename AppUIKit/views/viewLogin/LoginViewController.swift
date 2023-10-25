
import Foundation
import UIKit

class LoginViewController: UIViewController {

    @IBOutlet var viewContent: UIView!
    @IBOutlet weak var backgroundSV: UIScrollView!
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
        clicKeyboard()
        tfNameCustom.delegate = self
        tfPaswordCustom.delegate = self
        
        //Configuramos el label para que al hacer un tap vaya a la otra pantalla
        let tap = UITapGestureRecognizer(target: self, action: #selector(labelTapped))
        lbForgotPwCustom.isUserInteractionEnabled = true
        lbForgotPwCustom.addGestureRecognizer(tap)
        
        subscribeToNotification(UIResponder.keyboardWillShowNotification, selector: #selector(keyboardWillShowOrHide))
        subscribeToNotification(UIResponder.keyboardWillHideNotification, selector: #selector(keyboardWillShowOrHide))
        initializeHideKeyboard()
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
        unsubscribeFromAllNotifications()
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
        tfNameCustom.placeholder = "marisa.perez"
        tfNameCustom.keyboardType = .default
        
        //TextField contraseña
        tfPaswordCustom.placeholder = "Contraseña"
        
        //Label he olvidado contraseña
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
    
    //Al hacer clic fuera del teclado, que éste deje de verse
    private func clicKeyboard() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.dismissMyKeyboard(_:)))
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissMyKeyboard(_ sender: UITapGestureRecognizer? = nil) {
            view.endEditing(true)
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

extension LoginViewController {
    func initializeHideKeyboard(){
        //Declare a Tap Gesture Recognizer which will trigger our dismissMyKeyboard() function
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(dismissMyKeyboard))
        
        //Add this tap gesture recognizer to the parent view
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissMyKeyboard(){
        //endEditing causes the view (or one of its embedded text fields) to resign the first responder status.
        //In short- Dismiss the active keyboard.
        view.endEditing(true)
    }
}

extension LoginViewController {
    func subscribeToNotification(_ notification: NSNotification.Name, selector: Selector) {
        NotificationCenter.default.addObserver(self, selector: selector, name: notification, object: nil)
    }
    
    func unsubscribeFromAllNotifications() {
        NotificationCenter.default.removeObserver(self)
    }
  
    @objc func keyboardWillShowOrHide(notification: NSNotification) {
        // Get required info out of the notification
        if let scrollView = backgroundSV, let userInfo = notification.userInfo, let endValue = userInfo[UIResponder.keyboardFrameEndUserInfoKey], let durationValue = userInfo[UIResponder.keyboardAnimationDurationUserInfoKey], let curveValue = userInfo[UIResponder.keyboardAnimationCurveUserInfoKey] {
            
            // Transform the keyboard's frame into our view's coordinate system
            let endRect = view.convert((endValue as AnyObject).cgRectValue, from: view.window)
            
            // Find out how much the keyboard overlaps our scroll view
            let keyboardOverlap = scrollView.frame.maxY - endRect.origin.y
            
            // Set the scroll view's content inset & scroll indicator to avoid the keyboard
            scrollView.contentInset.bottom = keyboardOverlap
            scrollView.scrollIndicatorInsets.bottom = keyboardOverlap
            
            let duration = (durationValue as AnyObject).doubleValue
            let options = UIView.AnimationOptions(rawValue: UInt((curveValue as AnyObject).integerValue << 16))
            UIView.animate(withDuration: duration!, delay: 0, options: options, animations: {
                self.view.layoutIfNeeded()
            }, completion: nil)
        }
    }
}




