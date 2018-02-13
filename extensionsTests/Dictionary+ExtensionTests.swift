//
//  Dictionary+ExtensionTests.swift
//  extensionsTests
//
//  Created by shota_todoroki on 2018/02/13.
//  Copyright © 2018 shota_todoroki. All rights reserved.
//

import XCTest

class DictionaryExtensionTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testTryValue() {
        let dictionary: [String: Int]

        dictionary = ["hoge": 4, "fuga": 5]
        XCTAssertEqual(try dictionary.tryValue(key: "hoge"), 4)

        XCTAssertThrowsError(try dictionary.tryValue(key: "bar"))
    }

}
