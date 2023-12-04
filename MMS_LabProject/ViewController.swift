//
//  ViewController.swift
//  MMS_LabProject
//
//  Created by prk on 10/19/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    // commit
 
    @IBAction func loginUser(_ sender: Any) {
        if let nextView = storyboard?.instantiateViewController(identifier: "userView") {
            navigationController?.setViewControllers([nextView], animated: true)
        }
    }
    
    @IBAction func adminUser(_ sender: Any) {
        if let nextView = storyboard?.instantiateViewController(identifier: "adminView") {
            navigationController?.setViewControllers([nextView], animated: true)
        }
    }
}

