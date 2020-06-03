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
        setupLoginButton()
    }

    private func setupEmailTextField() {
        emailTextField.font = UIFont.systemFont(ofSize: 14)
        emailTextField.textColor = .white
        emailTextField.backgroundColor = Asset.Colors.wine.color
        emailTextField.setBottomBorder()
        emailTextField.attributedPlaceholder = NSAttributedString(
            string: "EMAIL",
            attributes: [.foregroundColor: UIColor.white])
        emailTextField.delegate = self
        emailTextField.autocapitalizationType = .none
        view.addSubview(emailTextField)
        emailTextField.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(bounds.size.height * 0.3)
            make.height.equalTo(60)
            make.left.right.equalToSuperview().inset(bounds.size.width * 0.05)
        }
    }

    private func setupPasswordTextField() {
        passwordTextField.font = UIFont.systemFont(ofSize: 14)
        passwordTextField.textColor = .white
        passwordTextField.backgroundColor = Asset.Colors.wine.color
        passwordTextField.setBottomBorder()
        passwordTextField.attributedPlaceholder = NSAttributedString(
                                                      string: "PASSWORD",
                                                      attributes: [.foregroundColor: UIColor.white])
        passwordTextField.isSecureTextEntry = true
        passwordTextField.delegate = self
        passwordTextField.autocapitalizationType = .none
        view.addSubview(passwordTextField)
        passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(emailTextField.snp.bottom).offset(10)
            make.height.equalTo(emailTextField.snp.height)
            make.left.equalTo(emailTextField.snp.left)
            make.right.equalTo(emailTextField.snp.right)
        }
    }

    private func setupLoginButton() {
        SignInButton.setTitle("Go", for: .normal)
        SignInButton.backgroundColor = Asset.Colors.wine.color
        SignInButton.cornerRadius = 5.0
        SignInButton.spinnerColor = .white
        SignInButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 22)
        view.addSubview(SignInButton)
        SignInButton.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp.bottom).offset(50)
            make.height.equalTo(emailTextField.snp.height)
            make.left.equalTo(emailTextField.snp.left)
            make.right.equalTo(emailTextField.snp.right)
        }
    }
}
