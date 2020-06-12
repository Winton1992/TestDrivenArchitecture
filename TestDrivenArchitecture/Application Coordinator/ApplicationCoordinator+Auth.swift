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
    func signInViewControllerDidSuccessfullySignIn(_ source: SignInViewController) {
        setupTabBarController()
    }
    
    func signInViewControllerDidTapSignUp(_ from: SignInViewController) {
        let signUpVC = SignUpViewController()
        if let navVc = self.window.rootViewController as? UINavigationController {
            navVc.fadeTo(signUpVC)
        }
    }
}
