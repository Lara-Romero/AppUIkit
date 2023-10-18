
import UIKit

class PasswordViewController: UIViewController {

    @IBOutlet weak var btnContinue: UIButton!
    
    @IBOutlet weak var viewContent: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loadButton()
        loadViewP()
        
    }

    
}

//Configuración de btn continue
extension PasswordViewController {
    func loadButton() {
        btnContinue.frame( forAlignmentRect: CGRect(x: 100, y: 100, width: 140, height: 52))
        btnContinue.backgroundColor = UIColor.white
    }
}

//Para darle el gradiente al color de fondo
extension PasswordViewController {
    func loadViewP() {
        
        //Colores
        let color1 = UIColor(named: "#001729")
        let color2 = UIColor(named: "#18629B")
        let gradientLayer = CAGradientLayer()
                gradientLayer.frame = viewContent.bounds
        
        gradientLayer.colors = [color1, color2]
        
        viewContent.layer.insertSublayer(gradientLayer, at: 0)
    }
    
}


