//
//  SettingsViewController+View.swift
//  TestDrivenArchitecture
//
//  Created by LIWEIJIE on 24/6/20.
//  Copyright © 2020 weijie. All rights reserved.
//

import Foundation
import UIKit

extension SettingsViewController {

    func setupScene() {
        setupTableView()
    }

    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
//        tableView.separatorStyle = .none
//        tableView.register(UserInfoTableViewCell.self)
//        tableView.register(SettingsTableViewCell.self)
//        tableView.register(SettingsSignoutTableViewCell.self)
        view.addSubview(tableView)

        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
