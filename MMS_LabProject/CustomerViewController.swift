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
        
        // Configure the cell with disc game information
        cell.itemTitleProduct.text = data.name
        cell.itemCategoryProduct.text = data.category
        cell.itemDetailProduct.text = data.description
        cell.itemPriceProduct.text = String(data.price)
        // Assuming 'imageProduct' is the image name, make sure to use the correct property for your Disc struct

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
        discGames.append(Disc(name: "Mobile Legend", category: "FPS", price: 2000, description: "Family Friendly Game"))
        discGames.append(Disc(name: "Mobile Legend", category: "FPS", price: 5000, description: "Family Friendly Game"))
        discGames.append(Disc(name: "Mobile Legend", category: "FPS", price: 7000, description: "Family Friendly Game"))
        discGames.append(Disc(name: "Mobile Legend", category: "FPS", price: 27000, description: "Family Friendly Game"))
    }
}
