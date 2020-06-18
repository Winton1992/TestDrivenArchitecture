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

protocol SignUpViewControllerDelegate: class {
    func signUpViewControllerDidSuccessfullySignUp(_ source: SignUpViewController)
}

class SignUpViewController: UIViewController, UITextFieldDelegate {
    
    var bounds = UIScreen.main.bounds
    var emailTextField: UITextField = UITextField()
    var passwordTextField: UITextField = UITextField()
    var passwordConfirmTextField: UITextField = UITextField()
    var errorLabel: UILabel = UILabel()
    let signUpButton: TransitionButton = TransitionButton()
    var viewModel: SignUpViewModel
    weak var delegate: SignUpViewControllerDelegate?
    
    init(viewModel: SignUpViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        view.backgroundColor = .white
        setupScene()
    }

    override func viewDidLoad() {
        setupBinding()
    }
    
    private func setupBinding() {
        emailTextField.reactive
            .textValues
            .observeValues(self.viewModel.inputs.emailChanged(email:))
        passwordTextField.reactive
            .textValues
            .observeValues(self.viewModel.inputs.passwordChanged(password:))
        signUpButton.reactive.controlEvents(.touchUpInside).observeValues { [weak self] _ in
            /**
             Disable them because the network is not always stable,
             and we don't want the user to change any of them while sending request
            */
            self?.isEnableTextFields(value: false)
            self?.signUpButton.startAnimation()
            // Quick validation of user input
            self?.validate()
        }
        viewModel.signUpResult.signal.observeValues { result in
            switch result.ifPass {
            case true:
                self.signUpButton.stopAnimation(animationStyle: .expand, completion: {
                    self.delegate?.signUpViewControllerDidSuccessfullySignUp(self)
                })
            case false:
                self.signUpButton.stopAnimation(animationStyle: .shake, completion: {
                    self.isEnableTextFields(value: true)
                    self.errorLabel.isHidden = false
                    self.errorLabel.text = result.message
                })
            }
        }
    }
    
    private func isEnableTextFields(value: Bool) {
        self.emailTextField.isEnabled = value
        self.passwordTextField.isEnabled = value
        self.passwordConfirmTextField.isEnabled = value
    }
    
    private func validate() {
        if self.emailTextField.text?.isEmpty == true {
            stopAnimation(errorMessage: Errors.SignUp.emailEmpty)
        } else if let email = self.emailTextField.text {
            if isValidEmail(email: email) == false {
                stopAnimation(errorMessage: Errors.SignUp.emailInvalid)
            } else if self.passwordTextField.text?.isEmpty == true {
                stopAnimation(errorMessage: Errors.SignUp.passwordEmpty)
            } else if self.passwordConfirmTextField.text?.isEmpty == true {
                stopAnimation(errorMessage: Errors.SignUp.passwordConfirmEmpty)
            } else if self.passwordTextField.text != self.passwordConfirmTextField.text {
                self.signUpButton.stopAnimation(animationStyle: .shake, completion: {
                    self.stopAnimation(errorMessage: Errors.SignUp.passwordNotMatch)
                })
            } else {
                self.viewModel.inputs.signUpButtonPressed()
            }
        }
    }
    
    private func stopAnimation(errorMessage: String) {
        self.signUpButton.stopAnimation(animationStyle: .shake, completion: {
            self.isEnableTextFields(value: true)
            self.errorLabel.isHidden = false
            self.errorLabel.text = errorMessage
        })
    }
    
    func isValidEmail(email: String) -> Bool {
        return email.contains("@") && email.contains(".")
    }
}
