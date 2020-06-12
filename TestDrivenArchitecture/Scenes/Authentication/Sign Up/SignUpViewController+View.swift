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
        emailTextField.font = UIFont.systemFont(ofSize: 14)
        emailTextField.textColor = .black
        emailTextField.attributedPlaceholder = NSAttributedString(string: "Current Location",
                                                                     attributes: [.foregroundColor: UIColor.gray])
        //emailTextField.setBottomBorderOnAssessment()
        emailTextField.delegate = self
        
        view.addSubview(emailTextField)
        
        emailTextField.snp.makeConstraints { make in
            //make.top.equalTo(lastNameTextField.snp.bottom).offset(10)
            make.height.equalTo(50)
            make.width.equalTo(bounds.width * 0.9)
            make.centerX.equalToSuperview()
        }
    }

    private func setupPasswordTextField() {
        
    }
    
    private func setupRePasswordTextField() {
        
    }
    
    private func setupErrorLabel() {
        
    }
    
    private func setupSignUpButton() {
        
    }
}
