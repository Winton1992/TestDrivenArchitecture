//
//  ApplicationCoordinator.swift
//  TestDrivenArchitecture
//
//  Created by LIWEIJIE on 1/6/20.
//  Copyright © 2020 weijie. All rights reserved.
//

import Foundation
import UIKit

class ApplicationCoordinator {
    let window: UIWindow
    
    /// Initialize with parameter UIWindow
    /// - Parameter window: UIWindow
    init(window: UIWindow) {
        self.window = window
    }
    
    /**
     Method being called after initializing
     We could validate user token and determines
     which view controller to show
     - Warning: Make sure to init application coordinator with an UIWindow before calling this method.
     - Returns: Void
     */
    func start() {
        let vm = SignInViewModel()
        let vc = SignInViewController(viewModel: vm)
        self.window.rootViewController = vc
        self.window.makeKeyAndVisible()
    }
}
