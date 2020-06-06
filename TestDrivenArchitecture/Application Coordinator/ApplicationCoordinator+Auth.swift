//
//  ApplicationCoordinator+Auth.swift
//  TestDrivenArchitecture
//
//  Created by LIWEIJIE on 4/6/20.
//  Copyright © 2020 weijie. All rights reserved.
//

import Foundation
import UIKit

extension ApplicationCoordinator: SignInViewControllerDelegate {
    func signInViewControllerDidPSuccessfullySignIn(_ source: SignInViewController) {
        setupTabBarController()
    }
}
