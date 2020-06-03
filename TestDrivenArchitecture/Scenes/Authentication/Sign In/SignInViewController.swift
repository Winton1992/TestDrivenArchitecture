//
//  SignInViewController.swift
//  TestDrivenArchitecture
//
//  Created by LIWEIJIE on 2/6/20.
//  Copyright © 2020 weijie. All rights reserved.
//

import Foundation
import UIKit
import TransitionButton

class SignInViewController: UIViewController, UITextFieldDelegate {

    var bounds = UIScreen.main.bounds
    var emailTextField: UITextField = UITextField()
    var passwordTextField: UITextField = UITextField()
    var SignInButton: TransitionButton = TransitionButton()

    override func loadView() {
        super.loadView()
        view.backgroundColor = Asset.Colors.wine.color
        setupScene()
    }

    override func viewDidLoad() {

    }
}
