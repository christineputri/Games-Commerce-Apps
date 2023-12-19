import UIKit
import CoreData

class EditTableDataViewController: UIViewController {
    
    @IBOutlet weak var titleUpdateData: UITextField!
    @IBOutlet weak var descUpdateData: UITextField!
    @IBOutlet weak var priceUpdateData: UITextField!
    @IBOutlet weak var categoryUpdateData: UITextField!
    @IBOutlet weak var imageUpdateData: UIImageView!
    
    var dataCellTable: dataItem!
    var arr = [dataItem?]()
    var updateCallback: ((dataItem) -> Void)! = nil
    var context: NSManagedObjectContext!
    var delegate: controlGameProduct?
    
    @IBAction func onSavedBtn(_ sender: Any) {
        var dataImage = dataCellTable.imageProduct
        guard let title = titleUpdateData.text, !title.isEmpty,
        let desc = descUpdateData.text, !desc.isEmpty,
        let priceTextField = priceUpdateData.text, let price = Int(priceTextField),
        let category = categoryUpdateData.text, !category.isEmpty
        else {
            showAlert(message: "Error data saved")
            return
        }
        
        dataCellTable?.titleProduct = title
        dataCellTable?.description = desc
        dataCellTable?.priceProduct = Int(price)
        dataCellTable?.categoryProduct = CategoryGame(rawValue: category) ?? .FPS
        dataCellTable?.imageProduct = dataImage
        updateCallback?(dataCellTable!)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("data dari prepare: \(String(describing: dataCellTable))")
        titleUpdateData.text = dataCellTable?.titleProduct ?? "Mobile Legend"
        descUpdateData.text = dataCellTable?.description ?? "game FPS"
        priceUpdateData.text = String(dataCellTable?.priceProduct ?? 1000)
        categoryUpdateData.text = dataCellTable?.categoryProduct.rawValue ?? CategoryGame.FPS.rawValue
        imageUpdateData.image = UIImage(named: dataCellTable.imageProduct) ?? UIImage(named: "mobile_legend")
    }
    
    func showAlert(message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
}
