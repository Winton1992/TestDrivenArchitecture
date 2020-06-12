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
        let signUpVC = SignUpViewController()
        self.window.rootViewController = signUpVC
    }
}
