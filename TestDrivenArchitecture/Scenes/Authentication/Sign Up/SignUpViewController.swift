//
//  SignUpViewController.swift
//  TestDrivenArchitecture
//
//  Created by LIWEIJIE on 11/6/20.
//  Copyright © 2020 weijie. All rights reserved.
//

import Foundation
import UIKit
import TransitionButton

class SignUpViewController: UIViewController, UITextFieldDelegate {
    
    var bounds = UIScreen.main.bounds
    var emailTextField: UITextField = UITextField()
    var passwordTextField: UITextField = UITextField()
    var passwordConfirmTextField: UITextField = UITextField()
    var errorLabel: UILabel = UILabel()
    let signUpButton: TransitionButton = TransitionButton()
    
    override func loadView() {
        super.loadView()
        view.backgroundColor = .white
        setupScene()
    }

    override func viewDidLoad() {
        setupBinding()
    }
    
    private func setupBinding() {
        
    }
}
