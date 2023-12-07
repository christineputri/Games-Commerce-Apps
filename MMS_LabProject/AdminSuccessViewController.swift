//
//  AdminSuccessViewController.swift
//  MMS_LabProject
//
//  Created by prk on 05/12/23.
//

import UIKit

class AdminSuccessViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func logoutButton(_ sender: UIButton) {
        navigateToAwal()
    }
    
    private func navigateToAwal() {
            if let ViewController = storyboard?.instantiateViewController(withIdentifier: "ViewController") {
                navigationController?.pushViewController(ViewController, animated: true)
            }
        }
}
