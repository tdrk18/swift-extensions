//
//  Int+ExtensionTests.swift
//  extensionsTests
//
//  Created by shota_todoroki on 2018/01/08.
//  Copyright © 2018 shota_todoroki. All rights reserved.
//

import XCTest

@testable import extensions

class IntExtensionTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testIsEven() {
        XCTAssertTrue(2.isEven)
        XCTAssertFalse(3.isEven)
        XCTAssertTrue(102.isEven)
        XCTAssertFalse(12345.isEven)
    }

}
