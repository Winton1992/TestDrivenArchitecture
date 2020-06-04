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
    var signInResult: MutableProperty<Bool> = MutableProperty(false)
    var emailChangedProperty = MutableProperty<String>("")
    var passwordChangedProperty = MutableProperty<String>("")
    var signInButtonPressedProperty = MutableProperty<Void>(())

    init() {
        let formData = Signal.combineLatest(emailChangedProperty.signal,
                                            passwordChangedProperty.signal,
                                            signInButtonPressedProperty.signal)
        formData.signal.observeValues { email, password, _ in
            self.signIn(email: email, password: password)
        }
    }
    
    func emailChanged(email: String) {
        emailChangedProperty.value = email
    }
    
    func passwordChanged(password: String) {
        passwordChangedProperty.value = password
    }
    
    func signInButtonPressed() {
        signInButtonPressedProperty.value = ()
    }
    
    private func signIn(email: String, password: String) {
        if email == "winton@test.com",
            password == "asd123" {
            signInResult.value = true
        } else {
            signInResult.value = false
        }
    }
}

