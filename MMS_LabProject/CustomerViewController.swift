//
//  CustomerViewController.swift
//  MMS_LabProject
//
//  Created by prk on 10/20/23.
//

//import UIKit
//
//class CustomerViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
//
//    @IBOutlet weak var tableViewCustomer: UITableView!
//
//    var discGames: [dataItem] = []
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return discGames.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ProductsTableViewCell
//        let data = discGames[indexPath.row]
//
//        cell.itemImageProduct.image = UIImage(named: data.imageProduct)
//        cell.itemTitleProduct.text = data.titleProduct
//        cell.itemCategoryProduct.text = data.categoryProduct.rawValue
//        cell.itemDetailProduct.text = data.description
//        cell.itemPriceProduct.text = String(data.priceProduct)
//
//        return cell
//    }
//
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 150
//    }
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        initData()
//        tableViewCustomer.dataSource = self
//        tableViewCustomer.delegate = self
//    }
//
//    func initData() {
//        discGames.append(dataItem(priceProduct: 2000, titleProduct: "Mobile Legend", categoryProduct: CategoryGame.FPS, description:  "Family Friendly Game", imageProduct: "mobile_legend"))
//        discGames.append(dataItem(priceProduct: 2000, titleProduct: "Mobile Legend", categoryProduct: CategoryGame.FPS, description:  "Family Friendly Game", imageProduct: "mobile_legend"))
//        discGames.append(dataItem(priceProduct: 2000, titleProduct: "Mobile Legend", categoryProduct: CategoryGame.FPS, description:  "Family Friendly Game", imageProduct: "mobile_legend"))
//        discGames.append(dataItem(priceProduct: 2000, titleProduct: "Mobile Legend", categoryProduct: CategoryGame.FPS, description:  "Family Friendly Game", imageProduct: "mobile_legend"))
//    }
//}

import UIKit

class CustomerViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var totalQuantity: Int = 0
    var totalPrice: Double = 0.0
    
    @IBOutlet weak var namaCustomer: UILabel!
    var nama: String?
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! ProductsTableViewCell
        cell.itemTitleProduct.text = arr[indexPath.row].titleProduct
        cell.itemCategoryProduct.text = arr[indexPath.row].categoryProduct.rawValue
        cell.itemDetailProduct.text = arr[indexPath.row].description
        cell.itemPriceProduct.text = "Rp. \(arr[indexPath.row].priceProduct)"
        cell.itemImageProduct.image = UIImage(named: arr[indexPath.row].imageProduct)
        
        return cell
    }
    
    @IBOutlet weak var tableViewCustomer: UITableView!
    var arr: [dataItem] = []
    
    func initData(){
        arr.append(dataItem(priceProduct: 2000, titleProduct: "Mobile Legend", categoryProduct: CategoryGame.FPS, description: "Family Friendly Game", imageProduct: "mobile_legend"))
        arr.append(dataItem(priceProduct: 5000, titleProduct: "Mobile Legend", categoryProduct: CategoryGame.FPS, description: "Family Friendly Game", imageProduct: "mobile_legend"))
        arr.append(dataItem(priceProduct: 7000, titleProduct: "Mobile Legend", categoryProduct: CategoryGame.FPS, description: "Family Friendly Game", imageProduct: "mobile_legend"))
        arr.append(dataItem(priceProduct: 27000, titleProduct: "Mobile Legend", categoryProduct: CategoryGame.FPS, description: "Family Friendly Game", imageProduct: "mobile_legend"))
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initData()
        tableViewCustomer.dataSource = self
        tableViewCustomer.delegate = self
        namaCustomer.text = "Hello, User \(nama!)"
    }
}
