import UIKit

class CustomerSuccessViewController: UIViewController {

    @IBAction func backHomeBtn(_ sender: Any) {
        if let nextView = storyboard?.instantiateViewController(withIdentifier: "userView") {
            let userView = nextView as! CustomerViewController
            navigationController?.setViewControllers([userView], animated: true)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
}
