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

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testColorWithImage() {
        XCTAssertNotNil(UIImage.image(color: .red, size: CGSize(width: 10.0, height: 10.0)))
        XCTAssertNotNil(UIImage.image(color: .blue, size: CGSize(width: 10.0, height: 10.0)))
        XCTAssertNotNil(UIImage.image(color: .green, size: CGSize(width: 10.0, height: 10.0)))
    }

    func testColorWithVerticalGradation() {
        XCTAssertNotNil(UIImage.imageWithVerticalGradation(start: .white, end: .black, size: CGSize(width: 10.0, height: 10.0)))
        XCTAssertNotNil(UIImage.imageWithVerticalGradation(start: .white, end: .red, size: CGSize(width: 10.0, height: 10.0)))
        XCTAssertNotNil(UIImage.imageWithVerticalGradation(start: .white, end: .blue, size: CGSize(width: 10.0, height: 10.0)))
    }

    func testColorWithHorizontalGradation() {
        XCTAssertNotNil(UIImage.imageWithHorizontalGradation(start: .white, end: .black, size: CGSize(width: 10.0, height: 10.0)))
        XCTAssertNotNil(UIImage.imageWithHorizontalGradation(start: .white, end: .red, size: CGSize(width: 10.0, height: 10.0)))
        XCTAssertNotNil(UIImage.imageWithHorizontalGradation(start: .white, end: .blue, size: CGSize(width: 10.0, height: 10.0)))
    }

    func testColorWithLeftSlantedGradation() {
        XCTAssertNotNil(UIImage.imageWithLeftSlantedGradation(start: .white, end: .black, size: CGSize(width: 10.0, height: 10.0)))
        XCTAssertNotNil(UIImage.imageWithLeftSlantedGradation(start: .white, end: .red, size: CGSize(width: 10.0, height: 10.0)))
        XCTAssertNotNil(UIImage.imageWithLeftSlantedGradation(start: .white, end: .blue, size: CGSize(width: 10.0, height: 10.0)))
    }

}
