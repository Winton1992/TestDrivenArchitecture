//
//  ApplicationCoordinator+Account.swift
//  TestDrivenArchitecture
//
//  Created by LIWEIJIE on 9/7/20.
//  Copyright © 2020 weijie. All rights reserved.
//

import UIKit

extension ApplicationCoordinator: AccountViewControllerDelegate {
    func accountViewControllerDidLogout(_ source: AccountViewController) {
        logout()
    }
}
