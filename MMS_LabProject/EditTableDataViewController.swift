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
    //var updateCallback: ((dataItem) -> Void)?
    
    @IBAction func onSavedBtn(_ sender: Any) {
        guard let title = titleUpdateData.text, !title.isEmpty,
              let desc = descUpdateData.text, !desc.isEmpty,
              let priceTextField = priceUpdateData.text, let price = Int(priceTextField),
              let category = categoryUpdateData.text, !category.isEmpty else {
            showAlert(message: "Error data saved")
            return
        }
        
        dataCellTable?.titleProduct = title
        dataCellTable?.description = desc
        dataCellTable?.priceProduct = Int(price)
        dataCellTable?.categoryProduct = CategoryGame(rawValue: category) ?? .FPS
        dataCellTable?.imageProduct = "mobile-legend"
        updateCallback?(dataCellTable!)
        updateData(with: dataCellTable!)

        if let nextView = storyboard?.instantiateViewController(identifier: "success_page") {
            let rootView = nextView as! AdminSuccessViewController
            navigationController?.setViewControllers([rootView], animated: true)
        }
        
        //loadView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("data dari prepare: \(String(describing: dataCellTable))")
        titleUpdateData.text = dataCellTable?.titleProduct ?? "Mobile Legend"
        descUpdateData.text = dataCellTable?.description ?? "game FPS"
        priceUpdateData.text = String(dataCellTable?.priceProduct ?? 1000)
        categoryUpdateData.text = dataCellTable?.categoryProduct.rawValue ?? CategoryGame.FPS.rawValue
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        context = appDelegate.persistentContainer.viewContext
        
        self.delegate?.loadData()
    }
    
    func updateData(with updatedData: dataItem) {
//        let oldName = arr[indexPath.row]?.titleProduct
//        let oldDesc = arr[indexPath.row]?.description
//        let oldPrice = arr[indexPath.row]?.priceProduct
//        let oldCategory = arr[indexPath.row]?.categoryProduct.rawValue
//
//        let newName = cell.itemTitleProduct.text
//        let newDesc = cell.itemDetailProduct.text
//        let newPrice = cell.itemPriceProduct.text
//        let newCategory = cell.itemCategoryProduct.text

//        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "GameProduct")
//        let predicate = NSPredicate(format: "productName==%@ AND productDesc==%@ AND productPrice==%d AND productCategory==%@", oldName!, oldDesc!, oldPrice!, oldCategory!)
//
//        do {
//            let result = try context.fetch(request) as! [NSManagedObject]
//
//            for data in result {
//                data.setValue(newName, forKey: "productName")
//                data.setValue(newDesc, forKey: "productDesc")
//                data.setValue(newPrice, forKey: "productPrice")
//                data.setValue(newCategory, forKey: "productCategory")
//            }
//
//            try context.save()
//            self.delegate?.loadData()
//        }
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "GameProduct")
        let predicate = NSPredicate(
            format: "productName == %@ AND productDesc==%@ AND productPrice==%d AND productCategory==%@",
            updatedData.titleProduct,
            updatedData.description,
            updatedData.priceProduct,
            updatedData.categoryProduct as! CVarArg)

            do {
                let result = try context.fetch(request) as! [NSManagedObject]

                for data in result {
                    data.setValue(updatedData.titleProduct, forKey: "productName")
                    data.setValue(updatedData.description, forKey: "productDesc")
                    data.setValue(updatedData.priceProduct, forKey: "productPrice")
                    data.setValue(updatedData.categoryProduct.rawValue, forKey: "productCategory")
                    data.setValue(updatedData.imageProduct, forKey: "productImage")
                }

                try context.save()
            } catch {
                print("Data update failed")
        }
    }
    
    func showAlert(message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
}
