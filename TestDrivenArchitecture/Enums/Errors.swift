//
//  Errors.swift
//  TestDrivenArchitecture
//
//  Created by LIWEIJIE on 17/6/20.
//  Copyright © 2020 weijie. All rights reserved.
//

import Foundation

enum Errors {
    enum SignUp {
        static let emailEmpty = "Email address cannot be empty."
        static let emailInvalid = "Email format is incorrect."
        static let passwordEmpty = "The Password field cannot be empty."
        static let passwordLengthInvalid = "Your password must be at least 8 characters. "
        static let passwordConfirmEmpty = "Re-enter password field cannot be empty."
        static let passwordNotMatch = "The password you input is inconsistent."
    }
}
