import UIKit

class FormAddDataAdminViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate{

    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var priceTextField: UITextField!
    
    @IBOutlet weak var imageProduct: UIImageView!
    var imageTemp = "mobile_legend"
    
//    @IBAction func addImage(_ sender: Any) {
//        let picker = UIImagePickerController()
//        picker.allowsEditing = true
//        picker.delegate = self
//        picker.sourceType = .photoLibrary
//        present(picker, animated: true)
//    }
    
    @IBAction func addDataToDatabase(_ sender: Any) {
//        arr.append(dataItem(priceProduct: Int(priceTextField.text), titleProduct: titleTextField.text, categoryProduct: CategoryGame.FPS, description: descriptionTextField.text, imageProduct: image))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.imageProduct.layer.masksToBounds = false
        self.imageProduct.clipsToBounds = true
        tapGesture()
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

}

//extension FormAddDataAdminViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
//    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
//        imageProduct.image = info[.originalImage] as? UIImage
//        dismiss(animated: true, completion: nil)
//    }
//}
