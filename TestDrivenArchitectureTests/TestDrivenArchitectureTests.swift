//
//  TestDrivenArchitectureTests.swift
//  TestDrivenArchitectureTests
//
//  Created by LIWEIJIE on 27/5/20.
//  Copyright © 2020 weijie. All rights reserved.
//

import XCTest
@testable import TestDrivenArchitecture

class TestDrivenArchitectureTests: XCTestCase {
    
    let vm = SignUpViewModel()

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testShouldPassIfValidEmail() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
//        self.vm.inputs.emailChanged(email: "test@test.com")
//        XCTAssertTrue(isValidEmail(email: self.vm.emailChangedProperty.value))
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func isValidEmail(email: String) -> Bool {
        return email.contains("@") && email.contains(".")
    }

}
