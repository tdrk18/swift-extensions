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

    private let size = CGSize(width: 10.0, height: 20.0)

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

        XCTAssertEqual(UIImage(color: .red, size: size).size, size)
    }

    func testInitWithGradation() {
        XCTAssertNotNil(UIImage(gradation: .vertical, start: .white, end: .black, size: size))
        XCTAssertNotNil(UIImage(gradation: .horizontal, start: .white, end: .black, size: size))
        XCTAssertNotNil(UIImage(gradation: .leftSlanted, start: .white, end: .black, size: size))
        XCTAssertNotNil(UIImage(gradation: .rightSlanted, start: .white, end: .black, size: size))

        XCTAssertEqual(UIImage(gradation: .vertical, start: .white, end: .black, size: size).size, size)
    }

    func testInitWithNamedAndTint() {
        let imageName = "light"
        XCTAssertNotNil(UIImage(named: imageName, tint: .red, size: size))
        XCTAssertNotNil(UIImage(named: imageName, tint: .green, size: size))
        XCTAssertNotNil(UIImage(named: imageName, tint: .blue, size: size))

        XCTAssertEqual(UIImage(named: imageName, tint: .red, size: size)?.size, size)

        let notExistedImageName = "notExisted"
        XCTAssertNil(UIImage(named: notExistedImageName, tint: .black, size: size))
    }

    func testInitWithNamedAndGradation() {
        let imageName = "light"
        XCTAssertNotNil(UIImage(named: imageName, gradation: .vertical, start: .white, end: .black, size: size))
        XCTAssertNotNil(UIImage(named: imageName, gradation: .horizontal, start: .white, end: .black, size: size))
        XCTAssertNotNil(UIImage(named: imageName, gradation: .leftSlanted, start: .white, end: .black, size: size))
        XCTAssertNotNil(UIImage(named: imageName, gradation: .rightSlanted, start: .white, end: .black, size: size))

        XCTAssertEqual(UIImage(named: imageName, gradation: .vertical, start: .white, end: .black, size: size)?.size, size)

        let notExistedImageName = "notExisted"
        XCTAssertNil(UIImage(named: notExistedImageName, gradation: .rightSlanted, start: .white, end: .black, size: size))
    }

    func testWithCornerRadius() {
        let image = UIImage(color: .red, size: size)
        XCTAssertNotNil(image.withCorner())
        XCTAssertNotNil(image.withCorner(radius: 2.0))
        XCTAssertNotNil(image.withCorner(radius: 10.0))
        XCTAssertNotNil(image.withCorner(radius: -2.0))
    }

    func testWithScaled() {
        let scale: CGFloat = 2.0
        let image = UIImage(color: .red, size: size)
        let scaledImage = image.scaled(by: scale)
        let newSize = CGSize(width: size.width * scale, height: size.height * scale)
        XCTAssertNotNil(scaledImage)
        XCTAssertEqual(scaledImage?.size, newSize)
    }

    func testWithScaledBySide() {
        let scale: CGFloat = 2.0
        let image = UIImage(color: .red, size: size)
        let newSize = CGSize(width: size.width * scale, height: size.height * scale)
        let scaledWidthImage = image.scaled(side: .width, to: size.width * scale)
        XCTAssertNotNil(scaledWidthImage)
        XCTAssertEqual(scaledWidthImage?.size, newSize)

        let scaledHeightImage = image.scaled(side: .height, to: size.height * scale)
        XCTAssertNotNil(scaledHeightImage)
        XCTAssertEqual(scaledHeightImage?.size, newSize)
    }

    func testRotateWithRadians() {
        let image = UIImage(color: .red, size: size)
        let rotatedImage1 = image.rotated(by: .pi)
        XCTAssertNotNil(rotatedImage1)
        XCTAssertEqual(rotatedImage1?.size, size)

        let rotatedImage2 = image.rotated(by: .pi / 2.0)
        XCTAssertNotNil(rotatedImage2)
        XCTAssertEqual(rotatedImage2?.size, CGSize(width: size.height, height: size.width))
    }
}
