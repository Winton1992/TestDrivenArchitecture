//
//  SignInViewController+View.swift
//  TestDrivenArchitecture
//
//  Created by LIWEIJIE on 2/6/20.
//  Copyright © 2020 weijie. All rights reserved.
//

import Device
import Foundation
import SnapKit

extension SignInViewController {

    func setupScene() {
        setupEmailTextField()
        setupPasswordTextField()
        setupErrorLabel()
        setupLoginButton()
    }

    private func setupEmailTextField() {
        emailTextField.setAttributes(placeHolderValue: "EMAIL")

        view.addSubview(emailTextField)

        emailTextField.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(bounds.size.height * 0.3)
            make.height.equalTo(60)
            make.left.right.equalToSuperview().inset(bounds.size.width * 0.05)
        }
    }

    private func setupPasswordTextField() {
        passwordTextField.setAttributes(placeHolderValue: "PASSWORD")
        passwordTextField.isSecureTextEntry = true

        view.addSubview(passwordTextField)

        passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(emailTextField.snp.bottom).offset(10)
            make.height.equalTo(emailTextField.snp.height)
            make.left.equalTo(emailTextField.snp.left)
            make.right.equalTo(emailTextField.snp.right)
        }
    }
    
    private func setupErrorLabel() {
        errorLabel.textAlignment = .center
        errorLabel.textColor = .white
        errorLabel.isHidden = true
        errorLabel.font = UIFont.systemFont(ofSize: 12)
        errorLabel.numberOfLines = 0
        view.addSubview(errorLabel)
        errorLabel.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp.bottom)
            make.centerX.equalToSuperview()
            make.height.equalTo(50)
            make.left.right.equalToSuperview().inset(30)
        }
    }

    private func setupLoginButton() {
        signInButton.setTitle("Go", for: .normal)
        signInButton.backgroundColor = Asset.Colors.wine.color
        signInButton.cornerRadius = 5.0
        signInButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 22)

        view.addSubview(signInButton)

        signInButton.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp.bottom).offset(50)
            make.height.equalTo(emailTextField.snp.height)
            make.left.equalTo(emailTextField.snp.left)
            make.right.equalTo(emailTextField.snp.right)
        }
    }
}
