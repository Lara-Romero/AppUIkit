
import UIKit

class RegisterViewController: UIViewController {

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
     
        //Image
        imageCustom.image = UIImage(named: "Alten")
        
        //TextField nombre
        tfNameCustom.placeholder = "marisa.perez"
        
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
}

extension RegisterViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
