import UIKit

class AdminSuccessViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func backHomeBtn(_ sender: Any) {
        if let nextView = storyboard?.instantiateViewController(identifier: "adminView") {
            let adminView = nextView as! AdminViewController
            navigationController?.setViewControllers([adminView], animated: true)
        }
    }
}
