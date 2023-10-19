
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
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        loadViewP()
        loadBtnReturn()
        loadButton()
        loadLb1()
        loadLb2()
        loadTfEmail()
    }
    
 
    func loadViewP() {
        // Colores con hex
        let color1 = UIColor(red: 0.0/238.0, green: 23.0/238.0, blue: 41.0/238.0, alpha: 1.0)
        let color2 = UIColor(red: 24.0/216.0, green: 98.0/216.0, blue: 155.0/216.0, alpha: 1.0)
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = viewContent.bounds
        
        gradientLayer.colors = [color1.cgColor, color2.cgColor]
        gradientLayer.startPoint = CGPoint(x: 1.0, y: 1.0)
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
        viewContent.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    func loadBtnReturn() {
        //btnReturn = UIButton(systemName: "arrow.left")
        
        
//        let button = UIButton(type: .system)
//
//        // Agrega un símbolo del sistema al botón
//        if let image = UIImage(systemName: "star.fill") {
//            button.setImage(image, for: .normal)
//        }
    }
    
    func loadButton() {
        btnContinueCustom.setTitle("Continuar", for: .normal)
        btnContinueCustom.setTitleColor(.blue, for: .normal)
        btnContinueCustom.backgroundColor = UIColor.white
        btnContinueCustom.layer.cornerRadius = 15
        btnContinueCustom.layer.borderWidth = 2
        btnContinueCustom.layer.borderColor = UIColor.blue.cgColor
        btnContinueCustom.layer.masksToBounds = true
    }
    
    @IBAction func validateEmail(_ sender: Any) {
        validateEmail()
        
    }
    
    func loadLb1() {
        //PAra comprobar si está la fuente en el sistema
       /* UIFont.familyNames.forEach({ familyName in
                   let fontNames = UIFont.fontNames(forFamilyName: familyName)
                   print(familyName, fontNames)
               }) */
        lb1.text = "¿No recuerdas tu contraseña?"
        lb1.textAlignment = .center
        lb1.textColor = .white
        lb1.font = UIFont(name: "OpenSans-Bold", size: 20.0)
     
    }
    
    func loadLb2() {
        lb2.text = "Introduce tu email y te enviaremos un enlace de restablecimiento"
        lb2.textAlignment = .center
        lb2.textColor = .white
        lb2.font = UIFont(name: "Open Sans", size: 16.0)
        
    }
}

extension PasswordViewController: UITextFieldDelegate {
    func loadTfEmail() {
        tfEmailCustom.delegate = self
        
        tfEmailCustom.placeholder = "Email"
        tfEmailCustom.keyboardType = .emailAddress
    }
    
    func validateEmail() {
        if let email = tfEmailCustom.text {
            if isvalidEmail(email: email) {
                print("Correo valido")
            } else {
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

/*
 funcion cuando aprietas boton {
 String correo = recoger lo que esta en el textfield
 
 if(validateEmail(correo)){
 } else {
 
 
 }
 */
  
