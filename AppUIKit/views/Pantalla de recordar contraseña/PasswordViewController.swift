
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
        btnContinueCustom.bottomButton(title: "Continuar")
        
        
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

  
