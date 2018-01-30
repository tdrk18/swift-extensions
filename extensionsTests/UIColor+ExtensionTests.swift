//
//  UIColor+ExtensionTests.swift
//  extensionsTests
//
//  Created by shota_todoroki on 2018/01/28.
//  Copyright © 2018 shota_todoroki. All rights reserved.
//

import XCTest

class UIColorExtensionTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testRGB() {
        var red, green, blue, yellow, cyan, magenta: UIColor

        red = UIColor.rgb(red: 255, green: 0, blue: 0)
        XCTAssertEqual(red, UIColor.red)
        red = UIColor.rgb(red: 255, green: 0, blue: 0, alpha: 1.0)
        XCTAssertEqual(red, UIColor.red)

        green = UIColor.rgb(red: 0, green: 255, blue: 0)
        XCTAssertEqual(green, UIColor.green)
        green = UIColor.rgb(red: 0, green: 255, blue: 0, alpha: 1.0)
        XCTAssertEqual(green, UIColor.green)

        blue = UIColor.rgb(red: 0, green: 0, blue: 255)
        XCTAssertEqual(blue, UIColor.blue)
        blue = UIColor.rgb(red: 0, green: 0, blue: 255, alpha: 1.0)
        XCTAssertEqual(blue, UIColor.blue)

        yellow = UIColor.rgb(red: 255, green: 255, blue: 0)
        XCTAssertEqual(yellow, UIColor.yellow)
        yellow = UIColor.rgb(red: 255, green: 255, blue: 0, alpha: 1.0)
        XCTAssertEqual(yellow, UIColor.yellow)

        cyan = UIColor.rgb(red: 0, green: 255, blue: 255)
        XCTAssertEqual(cyan, UIColor.cyan)
        cyan = UIColor.rgb(red: 0, green: 255, blue: 255, alpha: 1.0)
        XCTAssertEqual(cyan, UIColor.cyan)

        magenta = UIColor.rgb(red: 255, green: 0, blue: 255)
        XCTAssertEqual(magenta, UIColor.magenta)
        magenta = UIColor.rgb(red: 255, green: 0, blue: 255, alpha: 1.0)
        XCTAssertEqual(magenta, UIColor.magenta)
    }

    func testHexString() {
        var red, green, blue, yellow, cyan, magenta: UIColor

        red = UIColor.hexString("FF0000")
        XCTAssertEqual(red, UIColor.red)
        red = UIColor.hexString("FF0000", alpha: 1.0)
        XCTAssertEqual(red, UIColor.red)

        green = UIColor.hexString("00FF00")
        XCTAssertEqual(green, UIColor.green)
        green = UIColor.hexString("00FF00", alpha: 1.0)
        XCTAssertEqual(green, UIColor.green)

        blue = UIColor.hexString("0000FF")
        XCTAssertEqual(blue, UIColor.blue)
        blue = UIColor.hexString("0000FF", alpha: 1.0)
        XCTAssertEqual(blue, UIColor.blue)

        yellow = UIColor.hexString("FFFF00")
        XCTAssertEqual(yellow, UIColor.yellow)
        yellow = UIColor.hexString("FFFF00", alpha: 1.0)
        XCTAssertEqual(yellow, UIColor.yellow)

        cyan = UIColor.hexString("00FFFF")
        XCTAssertEqual(cyan, UIColor.cyan)
        cyan = UIColor.hexString("00FFFF", alpha: 1.0)
        XCTAssertEqual(cyan, UIColor.cyan)

        magenta = UIColor.hexString("FF00FF")
        XCTAssertEqual(magenta, UIColor.magenta)
        magenta = UIColor.hexString("FF00FF", alpha: 1.0)
        XCTAssertEqual(magenta, UIColor.magenta)
    }

}
