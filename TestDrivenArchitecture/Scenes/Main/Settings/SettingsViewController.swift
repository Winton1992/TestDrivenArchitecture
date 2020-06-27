//
//  SettingsViewController.swift
//  TestDrivenArchitecture
//
//  Created by LIWEIJIE on 24/6/20.
//  Copyright © 2020 weijie. All rights reserved.
//

import Foundation
import UIKit

class SettingsViewController: UIViewController {
    var tableView: UITableView = UITableView()
    
    override func loadView() {
        super.loadView()
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Settings"
        setupScene()
    }
    
    override func viewDidLoad() {
        
    }
}
