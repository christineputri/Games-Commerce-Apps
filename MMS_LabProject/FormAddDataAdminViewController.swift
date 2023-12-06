import UIKit

class FormAddDataAdminViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate{

    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var priceTextField: UITextField!
    
    var imageTemp = "mobile_legend"
    
    @IBAction func addImage(_ sender: Any) {
        let picker = UIImagePickerController()
        picker.allowsEditing = true
        picker.delegate = self
        picker.sourceType = .photoLibrary
        present(picker, animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let imageData = info[.editedImage] as? UIImage else {return}
        imageTemp = imageData.imageURL
        dismiss(animated: true)
    }
    
    @IBAction func addDataToDatabase(_ sender: Any) {
        arr.append(dataItem(priceProduct: Int(priceTextField.text), titleProduct: titleTextField.text, categoryProduct: CategoryGame.FPS, description: descriptionTextField.text, imageProduct: image))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}
