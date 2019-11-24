//
//  String+ExtensionTests.swift
//  extensionsTests
//
//  Created by shota_todoroki on 2018/01/21.
//  Copyright © 2018年 shota_todoroki. All rights reserved.
//

import XCTest

class StringExtensionTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testIsNotEmpty() {
        XCTAssertTrue("hogehoge".isNotEmpty)
        XCTAssertFalse("".isNotEmpty)
    }

    func testTrimmedWhiteSpace() {
        var string, expectedString: String

        string = "hogehoge  "
        expectedString = "hogehoge"
        XCTAssertEqual(string.trimmedWhiteSpace(), expectedString)

        string = "  hogehoge"
        expectedString = "hogehoge"
        XCTAssertEqual(string.trimmedWhiteSpace(), expectedString)

        string = "  hogehoge  "
        expectedString = "hogehoge"
        XCTAssertEqual(string.trimmedWhiteSpace(), expectedString)

        string = "   hoge fuga  "
        expectedString = "hoge fuga"
        XCTAssertEqual(string.trimmedWhiteSpace(), expectedString)

        string = "  "
        expectedString = ""
        XCTAssertEqual(string.trimmedWhiteSpace(), expectedString)
    }

    func testHasOnlyWhiteSpace() {
        var string: String

        string = "hogehoge  "
        XCTAssertFalse(string.hasOnlyWhiteSpace())

        string = "  hogehoge"
        XCTAssertFalse(string.hasOnlyWhiteSpace())

        string = "  hogehoge  "
        XCTAssertFalse(string.hasOnlyWhiteSpace())

        string = "   hoge fuga  "
        XCTAssertFalse(string.hasOnlyWhiteSpace())

        string = "  "
        XCTAssertTrue(string.hasOnlyWhiteSpace())
    }

}
