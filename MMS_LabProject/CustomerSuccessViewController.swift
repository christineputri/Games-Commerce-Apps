import UIKit

class CustomerSuccessViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
@IBAction func balikHome(_ sender: Any) {
    if let nextView = storyboard?.instantiateViewController(withIdentifier: "userView") {
        let userView = nextView as! CustomerViewController
        navigationController?.setViewControllers([userView], animated: true)
        }
    }
}
