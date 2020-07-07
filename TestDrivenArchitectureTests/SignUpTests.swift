//
//  SignUpTests.swift
//  TestDrivenArchitectureTests
//
//  Created by LIWEIJIE on 27/5/20.
//  Copyright © 2020 weijie. All rights reserved.
//

import XCTest
@testable import TestDrivenArchitecture

class SignUpTests: XCTestCase {
    
    let vm = SignUpViewModel()

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testShouldPassIfValidUsername() {
        self.vm.inputs.usernameChanged(username: "Winton")
        XCTAssertTrue(self.vm.isValidUserName())
    }

    func testShouldPassIfValidEmail() {
        self.vm.inputs.emailChanged(email: "test@test.com")
        XCTAssertTrue(self.vm.isValidEmail())
    }
    
    func testShouldPassIfInvalidEmail() {
        self.vm.inputs.emailChanged(email: "test.com")
        XCTAssertFalse(self.vm.isValidEmail())
    }
    
    func testShouldPassIfValidPasswordLength() {
        self.vm.inputs.passwordChanged(password: "12345678")
        XCTAssertTrue(self.vm.isValidPasswordLength())
    }
    
    func testShouldPassIfInvalidPasswordLength() {
        self.vm.inputs.passwordChanged(password: "123")
        XCTAssertFalse(self.vm.isValidPasswordLength())
    }
    
    func testShouldPassIfPasswordAndRepeatPasswordMatch() {
        self.vm.inputs.passwordChanged(password: "12345678")
        self.vm.inputs.passwordConfirmChanged(password: "12345678")
        XCTAssertTrue(self.vm.doPasswordsMatch())
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
