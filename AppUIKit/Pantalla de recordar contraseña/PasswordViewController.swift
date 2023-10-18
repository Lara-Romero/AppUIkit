
import UIKit

class PasswordViewController: UIViewController {

    @IBOutlet weak var btnContinue: UIButton!
    @IBOutlet weak var lb1: UILabel!
    @IBOutlet weak var lb2: UILabel!
    @IBOutlet weak var tfEmail: UITextField!
    @IBOutlet weak var viewContent: UIView!
   
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loadButton()
        loadViewP()
        loadLb1()
        loadLb2()
        loadTfEmail()
        
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
        lb1.text = "¿No recuerdas tu contraseña?"
    }
    
    func loadLb2() {
        lb1.text = "Introduce tu email y te enviaremos un enlace de restablecimiento"
    }
    
    func loadTfEmail() {
        
    }

}



//Para darle el gradiente al color de fondo
extension PasswordViewController {
    func loadViewP() {
        
       // Colores
        let color1 = UIColor(named: "#001729")
        let color2 = UIColor(named: "#18629B")
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = viewContent.bounds
        
        gradientLayer.colors = [color1, color2]
        
        viewContent.layer.insertSublayer(gradientLayer, at: 0)
    }
    
}

  
