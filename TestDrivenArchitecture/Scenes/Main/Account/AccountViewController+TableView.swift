//
//  AccountViewController+TableView.swift
//  TestDrivenArchitecture
//
//  Created by LIWEIJIE on 24/6/20.
//  Copyright © 2020 weijie. All rights reserved.
//

import Foundation
import UIKit

extension AccountViewController: UITableViewDelegate, UITableViewDataSource {
    /// Sections
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return ""
        default:
            return " "
        }
    }

    /// Rows
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "UserInfoCell", for: indexPath)
            return cell
        case 1:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "DefaultCell", for: indexPath) as? DefaultTableViewCell {
                cell.set(section: indexPath.section)
                return cell
            }
            return DefaultTableViewCell()
        default:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "SignOutCell", for: indexPath) as? SignOutTableviewCell {
                cell.delegate = self
                return cell
            }
            return SignOutTableviewCell()
        }
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 70
        default:
            return 50
        }
    }
}

extension AccountViewController: SignOutTableViewCellDelegate {
    func signOutTableViewCellDidTapSignoutButton(_ source: SignOutTableviewCell) {
        self.logout()
    }
}
