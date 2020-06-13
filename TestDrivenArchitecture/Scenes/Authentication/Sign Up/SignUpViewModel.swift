//
//  SignUpViewModel.swift
//  TestDrivenArchitecture
//
//  Created by LIWEIJIE on 11/6/20.
//  Copyright © 2020 weijie. All rights reserved.
//

import Foundation
import ReactiveSwift

protocol SignUpViewModelInputs {
    func emailChanged(email: String)
    func passwordChanged(password: String)
    func signUpButtonPressed()
}

protocol SignUpViewModelOutputs {
    var signUpResult: MutableProperty<Bool> { get }
}

protocol SignUpViewModelType {
    var inputs: SignUpViewModelInputs { get }
    var outputs: SignUpViewModelOutputs { get }
}

class SignUpViewModel: SignUpViewModelInputs, SignUpViewModelOutputs, SignUpViewModelType {
    var inputs: SignUpViewModelInputs { return self }
    var outputs: SignUpViewModelOutputs { return self }
    let defaults = UserDefaults.standard
    var signUpResult: MutableProperty<Bool> = MutableProperty(false)
    
    init() {
        let formData = Signal.combineLatest(emailChangedProperty.signal,
                                            passwordChangedProperty.signal,
                                            signUpButtonPressedProperty.signal)
        
        formData.signal.observeValues { email, password, _ in
            self.signUp(email: email, password: password)
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
    
    var signUpButtonPressedProperty = MutableProperty<Void>(())
    func signUpButtonPressed() {
        signUpButtonPressedProperty.value = ()
    }
    
    private func signUp(email: String, password: String) {
        // For demo purpose, we store the data locally and in a simple way
        defaults.set(email, forKey: "Email")
        defaults.set(password, forKey: "Password")
        defaults.set(true, forKey: "LoginStatus")
        signUpResult.value = true
    }
}
