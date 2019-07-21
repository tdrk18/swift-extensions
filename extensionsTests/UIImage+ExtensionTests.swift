//
//  UIImage+ExtensionTests.swift
//  extensionsTests
//
//  Created by tdrk18 on 2019/07/07.
//  Copyright © 2019 shota_todoroki. All rights reserved.
//

import XCTest

@testable import extensions

class UIImageExtensionTests: XCTestCase {

    private let size = CGSize(width: 10.0, height: 10.0)

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testInitWithColor() {
        XCTAssertNotNil(UIImage(color: .red, size: size))
        XCTAssertNotNil(UIImage(color: .blue, size: size))
        XCTAssertNotNil(UIImage(color: .green, size: size))
    }

    func testInitWithGradation() {
        XCTAssertNotNil(UIImage(gradation: .vertical, start: .white, end: .black, size: size))
        XCTAssertNotNil(UIImage(gradation: .horizontal, start: .white, end: .black, size: size))
        XCTAssertNotNil(UIImage(gradation: .leftSlanted, start: .white, end: .black, size: size))
        XCTAssertNotNil(UIImage(gradation: .rightSlanted, start: .white, end: .black, size: size))
    }

    func testInitWithNamedAndTint() {
        let imageName = "light"
        XCTAssertNotNil(UIImage(named: imageName, tint: .red, size: size))
        XCTAssertNotNil(UIImage(named: imageName, tint: .green, size: size))
        XCTAssertNotNil(UIImage(named: imageName, tint: .blue, size: size))

        let notExistedImageName = "notExisted"
        XCTAssertNil(UIImage(named: notExistedImageName, tint: .black, size: size))
    }

    func testInitWithNamedAndGradation() {
        let imageName = "light"
        XCTAssertNotNil(UIImage(named: imageName, gradation: .vertical, start: .white, end: .black, size: size))
        XCTAssertNotNil(UIImage(named: imageName, gradation: .horizontal, start: .white, end: .black, size: size))
        XCTAssertNotNil(UIImage(named: imageName, gradation: .leftSlanted, start: .white, end: .black, size: size))
        XCTAssertNotNil(UIImage(named: imageName, gradation: .rightSlanted, start: .white, end: .black, size: size))

        let notExistedImageName = "notExisted"
        XCTAssertNil(UIImage(named: notExistedImageName, gradation: .rightSlanted, start: .white, end: .black, size: size))
    }

}
