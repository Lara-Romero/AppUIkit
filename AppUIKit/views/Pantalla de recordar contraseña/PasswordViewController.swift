
import UIKit

#warning("[Practicas: Meter funcionalidad del teclado para que se vea correctamente cuando se pulsa el textField]")
#warning("[Practicas: Meter funcionalidad del tab para cuando se pulsa fuera del teclado]")
class PasswordViewController: UIViewController {
    // MARK: - Outlets
    @IBOutlet weak var viewContent: UIView!
    @IBOutlet weak var btnReturn: UIButton!
    @IBOutlet weak var lb1: UILabel!
    @IBOutlet weak var lb2: UILabel!
    @IBOutlet weak var tfEmailCustom: UITextField!
    @IBOutlet weak var btnContinueCustom: UIButton!
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setStyles()
        //clicKeyboard()
        tfEmailCustom.delegate = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        // Actualiza el marco de la capa del gradiente para que se ajuste al tamaño actual de la vista
        if let gradientLayer = self.view.layer.sublayers?.first as? CAGradientLayer {
            gradientLayer.frame = self.view.bounds
        }
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        .lightContent
    }
    
    deinit {
       
    }
    
    // MARK: - Actions
    @IBAction func validateEmail(_ sender: Any) {
        validateEmail()
    }
    
    private func clicKeyboard() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.dismissMyKeyboard(_:)))
        view.addGestureRecognizer(tap)
    }

    @objc func dismissMyKeyboard(_ sender: UITapGestureRecognizer? = nil) {
            view.endEditing(true)
    }
    
}

// MARK: - Private methods
private extension PasswordViewController {
    
    private func setStyles() {
        setGrandient()
        //Button Continue apparience
        btnContinueCustom.setTitle("Continuar", for: .normal)
        btnContinueCustom.setTitleColor(UIColor(red: 0.02, green: 0.24, blue: 0.4, alpha: 1), for: .normal)
        btnContinueCustom.backgroundColor = UIColor.white
        btnContinueCustom.layer.cornerRadius = 25
        btnContinueCustom.layer.borderWidth = 2
        btnContinueCustom.layer.borderColor = UIColor(red: 0.02, green: 0.24, blue: 0.4, alpha: 1).cgColor
        btnContinueCustom.layer.masksToBounds = true
        
        
        //Label1 apparience
        //PAra comprobar si está la fuente en el sistema
       /* UIFont.familyNames.forEach({ familyName in
                   let fontNames = UIFont.fontNames(forFamilyName: familyName)
                   print(familyName, fontNames)
               }) */
        lb1.text = "¿No recuerdas tu contraseña?"
        lb1.textAlignment = .center
        lb1.textColor = .white
        lb1.font = UIFont(name: "OpenSans-Bold", size: 20.0)
        
        
        //Label2 apparience
        lb2.text = "Introduce tu email y te enviaremos un enlace de restablecimiento"
        lb2.textAlignment = .center
        lb2.textColor = .white
        lb2.font = UIFont(name: "Open Sans", size: 16.0)
        
        
        //Tf Email
        tfEmailCustom.placeholder = "Email"
        tfEmailCustom.keyboardType = .emailAddress
        
        
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
    
    private func validateEmail() {
        if let email = tfEmailCustom.text {
            if email.isValidEmail() {
                let okAct = UIAlertAction(title: "OK", style: .default) { _ in
                    self.tfEmailCustom.text = ""
                }
                Util.createAlert(title: "Aviso", message: "Email correcto", actions: [okAct], presentVC: self)
            } else {
                let okAct = UIAlertAction(title: "OK", style: .default) { _ in
                    self.tfEmailCustom.text = ""
                }
                Util.createAlert(title: "Aviso", message: "Email incorrecto", actions: [okAct], presentVC: self)
            }
        }
    }
}

//private func validateEmail() {
//        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
//        if let email = tfEmailCustom.text {
//            if email.isValidEmail() {
//                Util.createAlert(title: "Verificar email", message: "Correo válido", actions: [okAction], presentVC: self)
//            } else {
//                Util.createAlert(title: "Verificar email", message: "Correo inválido", actions: [okAction], presentVC: self)
//            }
//            tfEmailCustom.text = ""
//        }
//    }

extension PasswordViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

  
