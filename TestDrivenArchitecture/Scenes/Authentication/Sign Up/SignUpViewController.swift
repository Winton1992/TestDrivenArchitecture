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
            if self?.emailTextField.text != "",
                self?.passwordTextField.text != "",
                self?.passwordConfirmTextField.text != "" {
                if self?.passwordTextField.text != self?.passwordConfirmTextField.text {
                    self?.signUpButton.stopAnimation(animationStyle: .shake, completion: {
                        self?.isEnableTextFields(value: true)
                        self?.errorLabel.isHidden = false
                        self?.errorLabel.text = L10n.passwordAndConfirmedPasswordAreDifferent
                    })
                } else {
                    self?.viewModel.inputs.signUpButtonPressed()
                }
            } else {
                self?.signUpButton.stopAnimation(animationStyle: .shake, completion: {
                    self?.isEnableTextFields(value: true)
                    self?.errorLabel.isHidden = false
                    self?.errorLabel.text = L10n.allTheTextfieldsWithConnotBeEmpty
                })
            }
        }
        viewModel.signUpResult.signal.observeValues { values in
            switch values {
            case true:
                self.signUpButton.stopAnimation(animationStyle: .expand, completion: {
                    self.delegate?.signUpViewControllerDidSuccessfullySignUp(self)
                })
            case false:
                self.signUpButton.stopAnimation(animationStyle: .shake, completion: {
                    self.isEnableTextFields(value: true)
                    self.errorLabel.isHidden = false
                    self.errorLabel.text = L10n.emailOrPasswordIsIncorrect
                })
            }
        }
    }
    
    private func isEnableTextFields(value: Bool) {
        self.emailTextField.isEnabled = value
        self.passwordTextField.isEnabled = value
        self.passwordConfirmTextField.isEnabled = value
    }
}
