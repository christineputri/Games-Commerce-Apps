import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var nama: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
 
    @IBAction func loginAdmin(_ sender: Any) {
        if let nextView = storyboard?.instantiateViewController(identifier: "adminView") {
            let adminView = nextView as! AdminViewController
            adminView.nama = nama.text
            navigationController?.setViewControllers([adminView], animated: true)
        }
    }
    
    @IBAction func loginUser(_ sender: Any) {
        if let nextView = storyboard?.instantiateViewController(identifier: "userView") {
            let customerView = nextView as! CustomerViewController
            
            customerView.nama = nama.text
            navigationController?.setViewControllers([customerView], animated: true)
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

