import UIKit

class CheckoutViewController: UIViewController {
    
    @IBOutlet weak var nameCC: UITextField!
    @IBOutlet weak var expCC: UITextField!
    @IBOutlet weak var cvvCC: UITextField!
    @IBOutlet weak var numberCC: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
    }

    @IBAction func paymentButtonTapped(_ sender: UIButton) {
        validateAndNavigateToSuccessPage()
    }

    func validateAndNavigateToSuccessPage() {
        guard let name = nameCC.text, !name.isEmpty,
              let expDate = expCC.text, !expDate.isEmpty,
              let cvv = cvvCC.text, !cvv.isEmpty,
              let ccNumber = numberCC.text, !ccNumber.isEmpty else {
            showAlert(message: "Please fill in the form to proceed.")
            return
        }
        navigateToSuccessPage()
    }

    func showAlert(message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }

    func navigateToSuccessPage() {
        if let nextView = storyboard?.instantiateViewController(identifier: "success_view") {
            let rootView = nextView as! CustomerSuccessViewController
            navigationController?.setViewControllers([rootView], animated: true)
        }
    }

}
