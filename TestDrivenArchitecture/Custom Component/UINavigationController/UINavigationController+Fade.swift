//
//  UINavigationController+Fade.swift
//  TestDrivenArchitecture
//
//  Created by LIWEIJIE on 12/6/20.
//  Copyright © 2020 weijie. All rights reserved.
//

import Foundation
import UIKit

extension UINavigationController {
    func fadeTo(_ viewController: UIViewController) {
        let transition: CATransition = CATransition()
        transition.duration = 0.6
        transition.type = CATransitionType.fade
        transition.subtype = CATransitionSubtype.fromRight
        view.layer.add(transition, forKey: nil)
        pushViewController(viewController, animated: true)
    }
}
