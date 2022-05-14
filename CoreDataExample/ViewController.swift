//
//  ViewController.swift
//  CoreDataExample
//
//  Created by Tariqul Islam on 14/5/22.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
     var viewModel = HomeDataViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
    }


    @IBAction func save(_ sender: Any) {
        viewModel.createDate()
    }
    
    @IBAction func retrive(_ sender: Any) {
        viewModel.retriveData()
    }
    @IBAction func deleteData(_ sender: Any) {
        viewModel.deleteData()
    }
}

