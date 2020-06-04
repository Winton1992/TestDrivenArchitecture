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

class SignInViewController: UIViewController, UITextFieldDelegate {

    var bounds = UIScreen.main.bounds
    var emailTextField: UITextField = UITextField()
    var passwordTextField: UITextField = UITextField()
    var errorLabel: UILabel = UILabel()
    var signInButton: TransitionButton = TransitionButton()
    var viewModel: SignInViewModel

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
        view.backgroundColor = Asset.Colors.wine.color
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
            self?.signInButton.startAnimation()
            if self?.emailTextField.text != "",
                self?.passwordTextField.text != "" {
                self?.emailTextField.isEnabled = false
                self?.passwordTextField.isEnabled = false
                self?.viewModel.inputs.signInButtonPressed()
            } else {
                self?.signInButton.stopAnimation(animationStyle: .shake, completion: {
                    self?.emailTextField.isEnabled = true
                    self?.passwordTextField.isEnabled = true
                    self?.errorLabel.isHidden = false
                    self?.errorLabel.text = L10n.emailOrPasswordCannotBeEmpty
                })
            }
        }
        viewModel.signInResult.signal.observeValues { values in
            switch values {
            case true:
                self.signInButton.stopAnimation(animationStyle: .expand, completion: {
                    //self.delegate?.signInViewControllerDidPSuccessfullySignIn(self)
                })
            case false:
                self.signInButton.stopAnimation(animationStyle: .shake, completion: {
                    self.emailTextField.isEnabled = true
                    self.passwordTextField.isEnabled = true
                    self.errorLabel.isHidden = false
                    self.errorLabel.text = L10n.emailOrPasswordIsIncorrect
                })
            }
        }
    }

}
