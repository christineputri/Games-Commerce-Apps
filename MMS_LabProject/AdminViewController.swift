import UIKit
import CoreData

protocol controlGameProduct {
   func loadData()
}


class AdminViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, controlGameProduct {
    
    @IBOutlet weak var namaAdmin: UILabel!
    var context: NSManagedObjectContext!
    var nama: String?
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! ProductsTableViewCell
        cell.itemTitleProduct.text = arr[indexPath.row].titleProduct
        cell.itemCategoryProduct.text = arr[indexPath.row].categoryProduct.rawValue
        cell.itemDetailProduct.text = arr[indexPath.row].description
        cell.itemPriceProduct.text = "$ \(arr[indexPath.row].priceProduct)"
        cell.itemImageProduct.image = UIImage(named: arr[indexPath.row].imageProduct)
        
        return cell
    }
    
    @IBOutlet weak var tableViewAdmin: UITableView!
    
    var arr: [dataItem]  = []
    
    func initData(){
        arr.append(dataItem(priceProduct: 300, titleProduct: "God Of War : Ragnarok", categoryProduct: CategoryGame.adventure, description: "Adventure story games about Gods", imageProduct: "godofwar"))
        arr.append(dataItem(priceProduct: 250, titleProduct: "Red Dead Redemption 2", categoryProduct: CategoryGame.adventure, description: "Open world game for you who want to be cowboy", imageProduct: "rdr2"))
        arr.append(dataItem(priceProduct: 500, titleProduct: "The Last Of Us", categoryProduct: CategoryGame.horror, description: "Survival story games in the zombie apocalypse", imageProduct: "tlou"))
        arr.append(dataItem(priceProduct: 200, titleProduct: "Uncharted 4", categoryProduct: CategoryGame.adventure, description: "Adveture story games and parkour mode", imageProduct: "uncharted4"))
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func loadData() {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "GameProduct")
        do {
            let result = try context.fetch(request) as! [NSManagedObject]
            
            for data in result {
                arr.append(dataItem(
                    priceProduct: data.value(forKey: "productPrice") as? Int ?? 1000,
                    titleProduct: data.value(forKey: "productName") as! String,
                    categoryProduct: CategoryGame(rawValue: data.value(forKey: "productCategory") as! CategoryGame.RawValue) ?? CategoryGame.adventure,
                    description: data.value(forKey: "productDesc") as! String,
                    imageProduct: data.value(forKey: "productImage") as! String))
            }
            tableViewAdmin.reloadData()
        } catch {
            print("Add error pas di bagian load data")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initData()
        tableViewAdmin.dataSource = self
        tableViewAdmin.delegate = self
        namaAdmin.text = "Hello, Admin \(nama ?? "Christine")"
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        context = appDelegate.persistentContainer.viewContext
        
        loadData()
    }
    
    @IBAction func logoutBtn(_ sender: Any) {
        if let nextView = storyboard?.instantiateViewController(identifier: "rootView") {
            let rootView = nextView as! ViewController
            navigationController?.setViewControllers([rootView], animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = (storyboard?.instantiateViewController(withIdentifier: "edit_cell") as? EditTableDataViewController){
            vc.dataCellTable = arr[indexPath.row]
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath)-> UITableViewCell.EditingStyle{
        return.delete
    }
    
    func tableView(_ tableView:UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath){
        tableView.beginUpdates()
        arr.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .fade)
        tableView.endUpdates()
    }
}
