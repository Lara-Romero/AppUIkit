
import UIKit

class PasswordViewController: UIViewController {

    @IBOutlet weak var viewContent: UIView!
    @IBOutlet weak var btnReturn: UIButton!
    @IBOutlet weak var lb1: UILabel!
    @IBOutlet weak var lb2: UILabel!
    @IBOutlet weak var tfEmailCustom: UITextField!
    @IBOutlet weak var btnContinueCustom: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        setStyles()
        loadTfEmail()
    }
    
 
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
     
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
   
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        setGrandient()
    }
    
    func setGrandient() {
        //Background gradient
        let color1 = UIColor(red: 0.0/238.0, green: 23.0/238.0, blue: 41.0/238.0, alpha: 1.0)
        let color2 = UIColor(red: 24.0/216.0, green: 98.0/216.0, blue: 155.0/216.0, alpha: 1.0)
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.view.bounds
        
        gradientLayer.colors = [color1.cgColor, color2.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 1.0)
      //  self.view.layer.insertSublayer(gradientLayer, at: 0)

        if gradientLayer.superlayer == nil {
            self.view.layer.insertSublayer(gradientLayer, at: 0)
        }
    }
    
    func setStyles() {
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
    }
    
    
    @IBAction func validateEmail(_ sender: Any) {
        validateEmail()
        
    }
}

extension PasswordViewController: UITextFieldDelegate {
    func loadTfEmail() {
        tfEmailCustom.delegate = self
        
        tfEmailCustom.placeholder = "Email"
        tfEmailCustom.keyboardType = .emailAddress
//        tfEmailCustom.addTarget(self, action: #selector(textFieldDidReturn), for: .editingDidEndOnExit)
//
//        @ojtc func textFieldDidReturn() {
//        }
    }
    
    
    func validateEmail() {
        if let email = tfEmailCustom.text {
            if isvalidEmail(email: email) {
                let alertController = UIAlertController(title: "Aviso", message: "Correo válido", preferredStyle: .alert)
                let okAct = UIAlertAction(title: "OK", style: .default, handler: nil)
                alertController.addAction(okAct)
                present(alertController, animated: true, completion: nil)
                print("Correo valido")
            } else {
                let alertController = UIAlertController(title: "Aviso", message: "Correo no válido", preferredStyle: .alert)
                let okAct = UIAlertAction(title: "OK", style: .default, handler: nil)
                alertController.addAction(okAct)
                present(alertController, animated: true, completion: nil)
                print("Correo invalido")
            }
        }
    }
    
    func isvalidEmail(email: String) -> Bool {
        let emailRegExn = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegExn)
        return emailPred.evaluate(with: email)
    }
    
}

  
