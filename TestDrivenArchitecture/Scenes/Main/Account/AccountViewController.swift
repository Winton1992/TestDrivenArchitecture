//
//  AccountViewController.swift
//  TestDrivenArchitecture
//
//  Created by LIWEIJIE on 24/6/20.
//  Copyright © 2020 weijie. All rights reserved.
//

import Foundation
import UIKit

protocol AccountViewControllerDelegate: class {
    func accountViewControllerDidLogout(_ source: AccountViewController)
}

class AccountViewController: UIViewController {
    weak var delegate: AccountViewControllerDelegate?
    var tableView: UITableView = UITableView()
    
    override func loadView() {
        super.loadView()
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Settings"
        setupScene()
    }
    
    override func viewDidLoad() {
    }
    
    func logout() {
        self.delegate?.accountViewControllerDidLogout(self)
    }
}
