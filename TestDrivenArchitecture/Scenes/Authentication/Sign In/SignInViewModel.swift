//
//  SignInViewModel.swift
//  TestDrivenArchitecture
//
//  Created by LIWEIJIE on 2/6/20.
//  Copyright © 2020 weijie. All rights reserved.
//

import Foundation
import ReactiveSwift

protocol SignInViewModelInputs {
    func emailChanged(email: String)
    func passwordChanged(password: String)
    func signInButtonPressed()
}

protocol SignInViewModelOutputs {
    var signInResult: MutableProperty<Bool> { get }
}

protocol SignInViewModelType {
    var inputs: SignInViewModelInputs { get }
    var outputs: SignInViewModelOutputs { get }
}

class SignInViewModel: SignInViewModelInputs, SignInViewModelOutputs, SignInViewModelType {
    var inputs: SignInViewModelInputs { return self }
    var outputs: SignInViewModelOutputs { return self }
    let defaults = UserDefaults.standard
    var signInResult: MutableProperty<Bool> = MutableProperty(false)

    init() {
        let formData = Signal.combineLatest(emailChangedProperty.signal,
                                            passwordChangedProperty.signal,
                                            signInButtonPressedProperty.signal)
        formData.signal.observeValues { email, password, _ in
            self.signIn(email: email, password: password)
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
    
    var signInButtonPressedProperty = MutableProperty<Void>(())
    func signInButtonPressed() {
        signInButtonPressedProperty.value = ()
    }
    
    private func signIn(email: String, password: String) {
        let userEmail = defaults.string(forKey: "Email")
        let userPassword = defaults.string(forKey: "Password")
        if email == userEmail,
            password == userPassword {
            defaults.set(true, forKey: "LoginStatus")
            signInResult.value = true
        } else {
            signInResult.value = false
        }
    }
}

