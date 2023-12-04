//
//  CustomerViewController.swift
//  MMS_LabProject
//
//  Created by prk on 10/20/23.
//

import UIKit

class CustomerViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableViewCustomer: UITableView!
    
    var discGames: [dataItem] = []

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return discGames.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ProductsTableViewCell
        let data = discGames[indexPath.row]
        
        cell.itemImageProduct.image = UIImage(named: data.imageProduct)
        cell.itemTitleProduct.text = data.titleProduct
        cell.itemCategoryProduct.text = data.categoryProduct.rawValue
        cell.itemDetailProduct.text = data.description
        cell.itemPriceProduct.text = String(data.priceProduct)

        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initData()
        tableViewCustomer.dataSource = self
        tableViewCustomer.delegate = self
    }

    func initData() {
        // Sample data for disc games (replace with your actual data)
        discGames.append(dataItem(priceProduct: 2000, titleProduct: "Mobile Legend", categoryProduct: CategoryGame.FPS, description:  "Family Friendly Game", imageProduct: "mobile_legend"))
        discGames.append(dataItem(priceProduct: 2000, titleProduct: "Mobile Legend", categoryProduct: CategoryGame.FPS, description:  "Family Friendly Game", imageProduct: "mobile_legend"))
        discGames.append(dataItem(priceProduct: 2000, titleProduct: "Mobile Legend", categoryProduct: CategoryGame.FPS, description:  "Family Friendly Game", imageProduct: "mobile_legend"))
        discGames.append(dataItem(priceProduct: 2000, titleProduct: "Mobile Legend", categoryProduct: CategoryGame.FPS, description:  "Family Friendly Game", imageProduct: "mobile_legend"))
    }
}
