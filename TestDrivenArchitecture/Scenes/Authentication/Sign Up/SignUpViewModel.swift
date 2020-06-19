//
//  SignUpViewModel.swift
//  TestDrivenArchitecture
//
//  Created by LIWEIJIE on 11/6/20.
//  Copyright © 2020 weijie. All rights reserved.
//

import Foundation
import ReactiveSwift

struct AuthResult {
    var ifPass: Bool = false
    var message: String = ""
}

protocol SignUpViewModelInputs {
    func emailChanged(email: String)
    func passwordChanged(password: String)
    func passwordConfirmChanged(password: String)
    func signUpButtonPressed()
}

protocol SignUpViewModelOutputs {
    var signUpResult: MutableProperty<AuthResult> { get }
}

protocol SignUpViewModelType {
    var inputs: SignUpViewModelInputs { get }
    var outputs: SignUpViewModelOutputs { get }
}

class SignUpViewModel: SignUpViewModelInputs, SignUpViewModelOutputs, SignUpViewModelType {
    var inputs: SignUpViewModelInputs { return self }
    var outputs: SignUpViewModelOutputs { return self }
    let defaults = UserDefaults.standard
    var signUpResult: MutableProperty<AuthResult> = MutableProperty(AuthResult())

    init() {
        signUpButtonPressedProperty.signal.observeValues { _ in
            self.validate()
        }
    }

    var emailChangedProperty = MutableProperty<String>("")
    func emailChanged(email: String) {
        emailChangedProperty.value = email
    }

    var passwordChangedProperty = MutableProperty<String>("")
    func passwordChanged(password: String) {
        passwordChangedProperty.value = password
    }

    var passwordConfirmChangedProperty = MutableProperty<String>("")
    func passwordConfirmChanged(password: String) {
        passwordConfirmChangedProperty.value = password
    }

    var signUpButtonPressedProperty = MutableProperty<Void>(())
    func signUpButtonPressed() {
        signUpButtonPressedProperty.value = ()
    }

    private func signUp(email: String, password: String) {
        // For demo purpose, we store the data locally and in a simple way.
        defaults.set(email, forKey: "Email")
        defaults.set(password, forKey: "Password")
        defaults.set(true, forKey: "LoginStatus")
        validationResult(ifPass: true, errorMessage: "")
    }

    private func validate() {
        if emailChangedProperty.value.isEmpty == true {
            validationResult(ifPass: false, errorMessage: Errors.SignUp.emailEmpty)
        } else if !isValidEmail() {
            validationResult(ifPass: false, errorMessage: Errors.SignUp.emailInvalid)
        } else if passwordChangedProperty.value.isEmpty == true {
            validationResult(ifPass: false, errorMessage: Errors.SignUp.passwordEmpty)
        } else if !isValidPasswordLength() {
            validationResult(ifPass: false, errorMessage: Errors.SignUp.passwordLengthInvalid)
        } else if passwordConfirmChangedProperty.value.isEmpty == true {
            validationResult(ifPass: false, errorMessage: Errors.SignUp.passwordConfirmEmpty)
        } else if !doPasswordsMatch() {
            validationResult(ifPass: false, errorMessage: Errors.SignUp.passwordNotMatch)
        } else {
            self.signUp(email: self.emailChangedProperty.value,
                        password: self.passwordChangedProperty.value)
        }
    }

    func validationResult(ifPass: Bool, errorMessage: String) {
        signUpResult.value.ifPass = ifPass
        signUpResult.value.message = errorMessage
    }

    func isValidEmail() -> Bool {
        return emailChangedProperty.value.contains("@") && emailChangedProperty.value.contains(".")
    }
    func isValidPasswordLength() -> Bool {
        return passwordChangedProperty.value.count >= 8 && passwordChangedProperty.value.count <= 16
    }
    func doPasswordsMatch() -> Bool {
        return passwordChangedProperty.value == passwordConfirmChangedProperty.value
    }
}
