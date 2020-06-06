//
//  MainTabBarViewController.swift
//  TestDrivenArchitecture
//
//  Created by LIWEIJIE on 4/6/20.
//  Copyright © 2020 weijie. All rights reserved.
//

import Foundation
import UIKit

class MainTabBarViewController: UITabBarController {
    override func loadView() {
        super.loadView()
        tabBar.backgroundColor = .white
        tabBar.isTranslucent = false
        view.backgroundColor = Asset.Colors.defaultWhite.color
    }
}
