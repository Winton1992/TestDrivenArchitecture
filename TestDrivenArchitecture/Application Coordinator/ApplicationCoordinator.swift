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
    let defaults = UserDefaults.standard
    
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
        let loginStatus = defaults.bool(forKey: "LoginStatus")
        if loginStatus == true {
            setupTabBarController()
        } else {
            pushSignInView()
        }
        self.window.makeKeyAndVisible()
    }
    
    func setupTabBarController() {
        let tabBarController = MainTabBarViewController()

        // Setting ViewController
        let accountVC = AccountViewController()
        accountVC.tabBarItem.title = "Me"
        accountVC.tabBarItem.image = Asset.Images.profile.image
        accountVC.delegate = self
        let settingVCWithNavigation = UINavigationController(rootViewController: accountVC)
        
        tabBarController.setViewControllers([settingVCWithNavigation], animated: true)
        self.window.rootViewController = tabBarController
    }
    
    func logout() {
        self.defaults.set(false, forKey: "LoginStatus")
        let vm = SignInViewModel()
        let vc = SignInViewController(viewModel: vm)
        vc.delegate = self
        self.window.rootViewController = vc
    }
}
