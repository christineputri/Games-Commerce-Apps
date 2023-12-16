//import UIKit
//
//class CheckoutViewController: UIViewController {
//
//    @IBOutlet weak var totalQuantity: UILabel!
//    @IBOutlet weak var totalPrice: UILabel!
//    @IBOutlet weak var nameCC: UITextField!
//    @IBOutlet weak var expCC: UITextField!
//    @IBOutlet weak var cvvCC: UITextField!
//    @IBOutlet weak var numberCC: UITextField!
//
//    var totalQuantityy: Int = 0
//    var totalPricee: Double = 0.0
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
////        updateUI()
//    }
//
//    //total quantity & price
//    func updateUI() {
//        totalQuantity.text = "Total Quantity: \(totalQuantityy)"
//        totalPrice.text = "Total Price: $\(totalPricee)"
//    }
//
//    // Validasi
//    func validateInput() -> Bool {
//        if !isValidName(nameCC.text ?? "") {
//            showErrorAlert(message: "Invalid name, please enter a valid name.")
//            return false
//        }
//
//        if !isValidCreditCardNumber(numberCC.text ?? "") {
//            showErrorAlert(message: "Invalid credit card number, please enter a 16-digit number.")
//            return false
//        }
//
//        if !isValidExpiryDate(expCC.text ?? "") {
//            showErrorAlert(message: "Invalid expiry date, please enter in the format MM/YYYY.")
//            return false
//        }
//
//        if !isValidCVV(cvvCC.text ?? "") {
//            showErrorAlert(message: "Invalid CVV, please enter a 3-digit number.")
//            return false
//        }
//
//        return true
//    }
//
//    func processPayment() {
//        showSuccessAlert(message: "Payment successful!")
//    }
//
//    func showSuccessAlert(message: String) {
//        let alertController = UIAlertController(title: "Success", message: message, preferredStyle: .alert)
//        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
//        alertController.addAction(okAction)
//        present(alertController, animated: true, completion: nil)
//    }
//
//    func showErrorAlert(message: String) {
//        let alertController = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
//        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
//        alertController.addAction(okAction)
//        present(alertController, animated: true, completion: nil)
//    }
//
//    // Validasi nama
//    func isValidName(_ name: String) -> Bool {
//        let nameRegex = "^[a-zA-Z]+$"
//        let namePredicate = NSPredicate(format: "SELF MATCHES %@", nameRegex)
//        return namePredicate.evaluate(with: name)
//    }
//
//    // Validasi cc number
//    func isValidCreditCardNumber(_ number: String) -> Bool {
//        let numberRegex = "^[0-9]{16}$"
//        let numberPredicate = NSPredicate(format: "SELF MATCHES %@", numberRegex)
//        return numberPredicate.evaluate(with: number)
//    }
//
//    // Validasi exp date
//    func isValidExpiryDate(_ date: String) -> Bool {
//        let dateRegex = "^(0[1-9]|1[0-2])/(20[2-9][0-9])$"
//        let datePredicate = NSPredicate(format: "SELF MATCHES %@", dateRegex)
//        return datePredicate.evaluate(with: date)
//    }
//
//    // Validasi CVV
//    func isValidCVV(_ cvv: String) -> Bool {
//        let cvvRegex = "^[0-9]{3}$"
//        let cvvPredicate = NSPredicate(format: "SELF MATCHES %@", cvvRegex)
//        return cvvPredicate.evaluate(with: cvv)
//    }
//
//    @IBAction func paymentButtonTapped(_ sender: Any) {
//        if validateInput() {
//            performSegue(withIdentifier: "CustomerViewController", sender: self)
//        }
//    }
//
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "CustomerViewController" {
//            let CustomerViewController = segue.destination as! CustomerViewController
//            CustomerViewController.totalQuantity = totalQuantityy
//            CustomerViewController.totalPrice = totalPricee
//        }
//    }
//
//
//    @IBAction func tesBtn(_ sender: Any) {
//        if let nextvview = storyboard?.instantiateViewController(withIdentifier: "success_view") {
//            let success = nextvview as! CustomerSuccessViewController
//            navigationController?.setViewControllers([success], animated: true)
//        }
//    }
//}

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
            // Tampilkan pesan kesalahan jika ada input yang kosong
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
        let successViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "success_view") as! CustomerSuccessViewController
        navigationController?.pushViewController(successViewController, animated: true)
    }

}

