//
//  AdminViewController.swift
//  MMS_LabProject
//
//  Created by prk on 10/20/23.
//

import UIKit

class AdminViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! ProductsTableViewCell
        
        cell.itemTitleProduct.text = arr[indexPath.row].titleProduct
        cell.itemCategoryProduct.text = arr[indexPath.row].categoryProduct.rawValue
        cell.itemDetailProduct.text = arr[indexPath.row].description
        cell.itemPriceProduct.text = String(arr[indexPath.row].priceProduct)
        cell.itemImageProduct.image = UIImage(named: arr[indexPath.row].imageProduct)
        
        return cell
    }
    
    @IBOutlet weak var tableViewAdmin: UITableView!
    
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
        tableViewAdmin.dataSource = self
        tableViewAdmin.delegate = self
    }
}
