//
//  ApplicationCoordinator+Navigation.swift
//  TestDrivenArchitecture
//
//  Created by LIWEIJIE on 11/6/20.
//  Copyright © 2020 weijie. All rights reserved.
//

import Foundation
import UIKit

extension ApplicationCoordinator {
    
    func pushSignUpView() {
        let signUpVM = SignUpViewModel()
        let signUpVC = SignUpViewController(viewModel: signUpVM)
        signUpVC.delegate = self
        if let navVc = self.window.rootViewController as? UINavigationController {
            navVc.fadeTo(signUpVC)
        }
    }
    
    func pushSignInView() {
        let vm = SignInViewModel()
        let vc = SignInViewController(viewModel: vm)
        vc.delegate = self
        let navigationVC = UINavigationController(rootViewController: vc)
        self.window.rootViewController = navigationVC
    }
}
