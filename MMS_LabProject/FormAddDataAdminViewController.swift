import UIKit
import CoreData

class FormAddDataAdminViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate{

    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var priceTextField: UITextField!
    @IBOutlet weak var categoryTextField: UITextField!
    
    var delegate: controlGameProduct?
    var arrGameProduct = [dataItem]()
    var context: NSManagedObjectContext!
    
    @IBOutlet weak var imageProduct: UIImageView!
    var imageTemp = "mobile_legend"
    
    @IBAction func addDataToDatabase(_ sender: Any) {
        if(titleTextField.text!.isEmpty && descriptionTextField.text!.isEmpty && (Int(priceTextField.text!) ?? 0 <= 0) && categoryTextField.text!.isEmpty){
            let alert = UIAlertController(title: "Alert", message: "title, category, price, and description field must be filled", preferredStyle: .alert)
            let alertAction = UIAlertAction(title: "ok", style: .default)
            alert.addAction(alertAction)
            present(alert, animated: true)
        }
        else{
            createData()
            if let nextView = storyboard?.instantiateViewController(identifier: "success_page") {
                let rootView = nextView as! AdminSuccessViewController
                navigationController?.setViewControllers([rootView], animated: true)
            }
        }
    }
    
    func createData() {
        let title = titleTextField.text!
        let description = descriptionTextField.text!
        let price = Int(priceTextField.text ?? "1000")
        let category = categoryTextField.text! 
        let image = "mobile_legend"
        let entity = NSEntityDescription.entity(forEntityName: "GameProduct", in: context)
        let newGameProduct = NSManagedObject(entity: entity!, insertInto: context)
        newGameProduct.setValue(title, forKey: "productName")
        newGameProduct.setValue(description, forKey: "productDesc")
        newGameProduct.setValue(price, forKey: "productPrice")
        newGameProduct.setValue(category, forKey: "productCategory")
        newGameProduct.setValue(image, forKey: "productImage")
        
        do {
            try context.save()
            self.delegate?.loadData()
        } catch {
            print("Data creation failed")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.imageProduct.layer.masksToBounds = false
        self.imageProduct.clipsToBounds = true
        tapGesture()
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        context = appDelegate.persistentContainer.viewContext
    }
    
    func tapGesture() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(imageTapped))
        imageProduct.isUserInteractionEnabled = true
        imageProduct.addGestureRecognizer(tap)
    }
    
    @objc func imageTapped() {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
        self.present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        imageProduct.image = info[.originalImage] as? UIImage
        dismiss(animated: true, completion: nil)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

}
