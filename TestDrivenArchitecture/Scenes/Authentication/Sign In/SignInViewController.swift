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
import ReactiveCocoa

protocol SignInViewControllerDelegate: class {
    func signInViewControllerDidSuccessfullySignIn(_ source: SignInViewController)
    func signInViewControllerDidTapSignUp(_ source: SignInViewController)
}

class SignInViewController: UIViewController, UITextFieldDelegate {

    var bounds = UIScreen.main.bounds
    var emailTextField: UITextField = UITextField()
    var passwordTextField: UITextField = UITextField()
    var errorLabel: UILabel = UILabel()
    var signInButton: TransitionButton = TransitionButton()
    var signUpButton: UIButton = UIButton()
    var viewModel: SignInViewModel
    weak var delegate: SignInViewControllerDelegate?

    init(viewModel: SignInViewModel) {
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
        signInButton.reactive.controlEvents(.touchUpInside).observeValues { [weak self] _ in
            /**
             Disable them because the network is not always stable,
             and we don't want the user to change any of them while sending request
            */
            self?.isEnableTextFields(value: false)
            self?.signInButton.startAnimation()
            if self?.emailTextField.text != "",
                self?.passwordTextField.text != "" {
                self?.isEnableTextFields(value: false)
                self?.viewModel.inputs.signInButtonPressed()
            } else {
                self?.signInButton.stopAnimation(animationStyle: .shake, completion: {
                    self?.isEnableTextFields(value: true)
                    self?.errorLabel.isHidden = false
                    self?.errorLabel.text = L10n.emailOrPasswordCannotBeEmpty
                })
            }
        }
        signUpButton.reactive.controlEvents(.touchUpInside).observeValues { [weak self] _ in
            if let self = self {
                self.delegate?.signInViewControllerDidTapSignUp(self)
            }
        }
        viewModel.signInResult.signal.observeValues { values in
            switch values {
            case true:
                self.signInButton.stopAnimation(animationStyle: .expand, completion: {
                    self.delegate?.signInViewControllerDidSuccessfullySignIn(self)
                })
            case false:
                self.signInButton.stopAnimation(animationStyle: .shake, completion: {
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
    }

}
