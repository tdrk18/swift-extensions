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
        XCTAssertEqual(red, .red)
        red = UIColor.rgb(red: 255, green: 0, blue: 0, alpha: 1.0)
        XCTAssertEqual(red, .red)

        green = UIColor.rgb(red: 0, green: 255, blue: 0)
        XCTAssertEqual(green, .green)
        green = UIColor.rgb(red: 0, green: 255, blue: 0, alpha: 1.0)
        XCTAssertEqual(green, .green)

        blue = UIColor.rgb(red: 0, green: 0, blue: 255)
        XCTAssertEqual(blue, .blue)
        blue = UIColor.rgb(red: 0, green: 0, blue: 255, alpha: 1.0)
        XCTAssertEqual(blue, .blue)

        yellow = UIColor.rgb(red: 255, green: 255, blue: 0)
        XCTAssertEqual(yellow, .yellow)
        yellow = UIColor.rgb(red: 255, green: 255, blue: 0, alpha: 1.0)
        XCTAssertEqual(yellow, .yellow)

        cyan = UIColor.rgb(red: 0, green: 255, blue: 255)
        XCTAssertEqual(cyan, .cyan)
        cyan = UIColor.rgb(red: 0, green: 255, blue: 255, alpha: 1.0)
        XCTAssertEqual(cyan, .cyan)

        magenta = UIColor.rgb(red: 255, green: 0, blue: 255)
        XCTAssertEqual(magenta, .magenta)
        magenta = UIColor.rgb(red: 255, green: 0, blue: 255, alpha: 1.0)
        XCTAssertEqual(magenta, .magenta)
    }

    func testHex() {
        var red, green, blue, yellow, cyan, magenta: UIColor

        red = UIColor.hex(0xFF0000)
        XCTAssertEqual(red, .red)
        red = UIColor.hex(0xFF0000, alpha: 1.0)
        XCTAssertEqual(red, .red)

        green = UIColor.hex(0x00FF00)
        XCTAssertEqual(green, .green)
        green = UIColor.hex(0x00FF00, alpha: 1.0)
        XCTAssertEqual(green, .green)

        blue = UIColor.hex(0x0000FF)
        XCTAssertEqual(blue, .blue)
        blue = UIColor.hex(0x0000FF, alpha: 1.0)
        XCTAssertEqual(blue, .blue)

        yellow = UIColor.hex(0xFFFF00)
        XCTAssertEqual(yellow, .yellow)
        yellow = UIColor.hex(0xFFFF00, alpha: 1.0)
        XCTAssertEqual(yellow, .yellow)

        cyan = UIColor.hex(0x00FFFF)
        XCTAssertEqual(cyan, .cyan)
        cyan = UIColor.hex(0x00FFFF, alpha: 1.0)
        XCTAssertEqual(cyan, .cyan)

        magenta = UIColor.hex(0xFF00FF)
        XCTAssertEqual(magenta, .magenta)
        magenta = UIColor.hex(0xFF00FF, alpha: 1.0)
        XCTAssertEqual(magenta, .magenta)
    }

    func testHexString() {
        var red, green, blue, yellow, cyan, magenta: UIColor

        red = UIColor.hexString("FF0000")
        XCTAssertEqual(red, .red)
        red = UIColor.hexString("#FF0000")
        XCTAssertEqual(red, .red)
        red = UIColor.hexString("FF0000", alpha: 1.0)
        XCTAssertEqual(red, .red)

        green = UIColor.hexString("00FF00")
        XCTAssertEqual(green, .green)
        green = UIColor.hexString("#00FF00")
        XCTAssertEqual(green, .green)
        green = UIColor.hexString("00FF00", alpha: 1.0)
        XCTAssertEqual(green, .green)

        blue = UIColor.hexString("0000FF")
        XCTAssertEqual(blue, .blue)
        blue = UIColor.hexString("#0000FF")
        XCTAssertEqual(blue, .blue)
        blue = UIColor.hexString("0000FF", alpha: 1.0)
        XCTAssertEqual(blue, .blue)

        yellow = UIColor.hexString("FFFF00")
        XCTAssertEqual(yellow, .yellow)
        yellow = UIColor.hexString("#FFFF00")
        XCTAssertEqual(yellow, .yellow)
        yellow = UIColor.hexString("FFFF00", alpha: 1.0)
        XCTAssertEqual(yellow, .yellow)

        cyan = UIColor.hexString("00FFFF")
        XCTAssertEqual(cyan, .cyan)
        cyan = UIColor.hexString("#00FFFF")
        XCTAssertEqual(cyan, .cyan)
        cyan = UIColor.hexString("00FFFF", alpha: 1.0)
        XCTAssertEqual(cyan, .cyan)

        magenta = UIColor.hexString("FF00FF")
        XCTAssertEqual(magenta, .magenta)
        magenta = UIColor.hexString("#FF00FF")
        XCTAssertEqual(magenta, .magenta)
        magenta = UIColor.hexString("FF00FF", alpha: 1.0)
        XCTAssertEqual(magenta, .magenta)
    }

}
