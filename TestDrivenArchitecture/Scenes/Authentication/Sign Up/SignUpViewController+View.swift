//
//  SignUpViewController+View.swift
//  TestDrivenArchitecture
//
//  Created by LIWEIJIE on 11/6/20.
//  Copyright © 2020 weijie. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

extension SignUpViewController {

    func setupScene() {
        setupEmailTextField()
        setupPasswordTextField()
        setupRePasswordTextField()
        setupErrorLabel()
        setupSignUpButton()
    }
    
    private func setupEmailTextField() {
        emailTextField.setAttributes(placeHolderValue: "Email")
        
        view.addSubview(emailTextField)
        
        emailTextField.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(bounds.size.height * 0.25)
            make.height.equalTo(60)
            make.left.right.equalToSuperview().inset(bounds.size.width * 0.05)
        }
    }

    private func setupPasswordTextField() {
        passwordTextField.setAttributes(placeHolderValue: "Password")
        passwordTextField.isSecureTextEntry = true

        view.addSubview(passwordTextField)

        passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(emailTextField.snp.bottom).offset(10)
            make.height.equalTo(emailTextField.snp.height)
            make.left.equalTo(emailTextField.snp.left)
            make.right.equalTo(emailTextField.snp.right)
        }
    }
    
    private func setupRePasswordTextField() {
        passwordConfirmTextField.setAttributes(placeHolderValue: "Re-Enter Password")
        passwordConfirmTextField.isSecureTextEntry = true

        view.addSubview(passwordConfirmTextField)

        passwordConfirmTextField.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp.bottom).offset(10)
            make.height.equalTo(emailTextField.snp.height)
            make.left.equalTo(emailTextField.snp.left)
            make.right.equalTo(emailTextField.snp.right)
        }
    }
    
    private func setupErrorLabel() {
        errorLabel.textAlignment = .center
        errorLabel.textColor = Asset.Colors.defaultBlack.color
        errorLabel.isHidden = true
        errorLabel.font = UIFont.systemFont(ofSize: 12)
        errorLabel.numberOfLines = 0
        view.addSubview(errorLabel)
        errorLabel.snp.makeConstraints { make in
            make.top.equalTo(passwordConfirmTextField.snp.bottom)
            make.centerX.equalToSuperview()
            make.height.equalTo(50)
            make.left.right.equalToSuperview().inset(30)
        }
    }
    
    private func setupSignUpButton() {
        signUpButton.setTitle("SIGN UP", for: .normal)
        signUpButton.backgroundColor = Asset.Colors.wine.color
        signUpButton.cornerRadius = 5.0
        signUpButton.titleLabel?.font = UIFont.systemFont(ofSize: 22)

        view.addSubview(signUpButton)

        signUpButton.snp.makeConstraints { make in
            make.top.equalTo(passwordConfirmTextField.snp.bottom).offset(50)
            make.height.equalTo(emailTextField.snp.height)
            make.left.equalTo(emailTextField.snp.left)
            make.right.equalTo(emailTextField.snp.right)
        }
    }
}
