//
//  UIView+ExtensionTests.swift
//  extensionsTests
//
//  Created by shota_todoroki on 2018/02/11.
//  Copyright © 2018 shota_todoroki. All rights reserved.
//

import XCTest

class UIViewExtensionTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testOrigin() {
        var view: UIView
        var expect: CGPoint

        view = UIView.init(frame: CGRect.init(x: 0, y: 0, width: 300, height: 200))
        expect = CGPoint.init(x: 0, y: 0)
        XCTAssertEqual(view.origin(), expect)

        view = UIView.init(frame: CGRect.init(x: 50, y: 30, width: 180, height: 270))
        expect = CGPoint.init(x: 50, y: 30)
        XCTAssertEqual(view.origin(), expect)
    }

    func testOriginX() {
        var view: UIView
        var expect: CGFloat

        view = UIView.init(frame: CGRect.init(x: 0, y: 0, width: 300, height: 200))
        expect = 0.0
        XCTAssertEqual(view.originX(), expect)

        view = UIView.init(frame: CGRect.init(x: 50, y: 30, width: 180, height: 270))
        expect = 50.0
        XCTAssertEqual(view.originX(), expect)
    }

    func testOriginY() {
        var view: UIView
        var expect: CGFloat

        view = UIView.init(frame: CGRect.init(x: 0, y: 0, width: 300, height: 200))
        expect = 0.0
        XCTAssertEqual(view.originY(), expect)

        view = UIView.init(frame: CGRect.init(x: 50, y: 30, width: 180, height: 270))
        expect = 30.0
        XCTAssertEqual(view.originY(), expect)
    }

    func testCenterX() {
        var view: UIView
        var expect: CGFloat

        view = UIView.init(frame: CGRect.init(x: 0, y: 0, width: 300, height: 200))
        expect = 150.0
        XCTAssertEqual(view.centerX(), expect)

        view = UIView.init(frame: CGRect.init(x: 50, y: 30, width: 180, height: 270))
        expect = 140.0
        XCTAssertEqual(view.centerX(), expect)
    }

    func testCenterY() {
        var view: UIView
        var expect: CGFloat

        view = UIView.init(frame: CGRect.init(x: 0, y: 0, width: 300, height: 200))
        expect = 100.0
        XCTAssertEqual(view.centerY(), expect)

        view = UIView.init(frame: CGRect.init(x: 50, y: 30, width: 180, height: 270))
        expect = 165.0
        XCTAssertEqual(view.centerY(), expect)
    }

}
