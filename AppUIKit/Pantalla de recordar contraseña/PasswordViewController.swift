
import UIKit

class PasswordViewController: UIViewController {

    @IBOutlet weak var btnContinue: UIButton!
    @IBOutlet weak var lb1: UILabel!
    @IBOutlet weak var lb2: UILabel!
    @IBOutlet weak var tfEmail: UITextField!
    @IBOutlet weak var viewContent: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        loadViewP()
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
    
    func loadButton() {
        btnContinue.setTitle("Continuar", for: .normal)
        btnContinue.setTitleColor(.blue, for: .normal)
        btnContinue.backgroundColor = UIColor.white
        btnContinue.layer.cornerRadius = 15
        btnContinue.layer.borderWidth = 2
        btnContinue.layer.borderColor = UIColor.blue.cgColor
        btnContinue.layer.masksToBounds = true

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
        //lb1.font = UIFont.boldSystemFont(ofSize: 20.0)
        lb1.font = UIFont(name: "OpenSans-Bold", size: 20.0)
     
    }
    
    func loadLb2() {
        lb2.text = "Introduce tu email y te enviaremos un enlace de restablecimiento"
        lb2.textAlignment = .center
        lb2.textColor = .white
        lb2.font = UIFont(name: "Open Sans", size: 16.0)
        
    }
    
    func loadTfEmail() {
        
        
    }

}

extension PasswordViewController: UITextFieldDelegate {
    
}


  
