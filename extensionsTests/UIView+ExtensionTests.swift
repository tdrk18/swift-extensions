//
//  UIView+ExtensionTests.swift
//  extensionsTests
//
//  Created by shota_todoroki on 2018/02/11.
//  Copyright © 2018 shota_todoroki. All rights reserved.
//

import XCTest
@testable import extensions

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

        expect = CGPoint.init(x: 0, y: 0)
        view = UIView.init(frame: CGRect.init(x: expect.x, y: expect.y, width: 300, height: 200))
        XCTAssertEqual(view.origin, expect)

        expect = CGPoint.init(x: 50, y: 30)
        view = UIView.init(frame: CGRect.init(x: expect.x, y: expect.y, width: 180, height: 270))
        XCTAssertEqual(view.origin, expect)

        expect = CGPoint.init(x: 100, y: 200)
        view.origin = expect
        XCTAssertEqual(view.origin, expect)
    }

    func testOriginX() {
        var view: UIView
        var expect: CGFloat

        expect = 0.0
        view = UIView.init(frame: CGRect.init(x: expect, y: 0, width: 300, height: 200))
        XCTAssertEqual(view.originX, expect)

        expect = 50.0
        view = UIView.init(frame: CGRect.init(x: expect, y: 30, width: 180, height: 270))
        XCTAssertEqual(view.originX, expect)

        expect = 200.0
        view.originX = expect
        XCTAssertEqual(view.originX, expect)
    }

    func testOriginY() {
        var view: UIView
        var expect: CGFloat

        expect = 0.0
        view = UIView.init(frame: CGRect.init(x: 0, y: expect, width: 300, height: 200))
        XCTAssertEqual(view.originY, expect)

        expect = 30.0
        view = UIView.init(frame: CGRect.init(x: 50, y: expect, width: 180, height: 270))
        XCTAssertEqual(view.originY, expect)

        expect = 300.0
        view.originY = expect
        XCTAssertEqual(view.originY, expect)
    }

    func testCenterX() {
        var view: UIView
        var expect: CGFloat

        expect = 150.0
        view = UIView.init(frame: CGRect.init(x: 0, y: 0, width: 300, height: 200))
        XCTAssertEqual(view.centerX, expect)

        expect = 140.0
        view = UIView.init(frame: CGRect.init(x: 50, y: 30, width: 180, height: 270))
        XCTAssertEqual(view.centerX, expect)

        expect = 260.0
        view.centerX = expect
        XCTAssertEqual(view.centerX, expect)
    }

    func testCenterY() {
        var view: UIView
        var expect: CGFloat

        expect = 100.0
        view = UIView.init(frame: CGRect.init(x: 0, y: 0, width: 300, height: 200))
        XCTAssertEqual(view.centerY(), expect)

        expect = 165.0
        view = UIView.init(frame: CGRect.init(x: 50, y: 30, width: 180, height: 270))
        XCTAssertEqual(view.centerY(), expect)

        expect = 155.0
        view.centerY(expect)
        XCTAssertEqual(view.centerY(), expect)
    }

    func testLeft() {
        var view: UIView
        var expect: CGFloat

        expect = 0.0
        view = UIView.init(frame: CGRect.init(x: 0, y: 0, width: 300, height: 200))
        XCTAssertEqual(view.left(), expect)

        expect = 50.0
        view = UIView.init(frame: CGRect.init(x: 50, y: 30, width: 180, height: 270))
        XCTAssertEqual(view.left(), expect)

        expect = 5.0
        view.left(expect)
        XCTAssertEqual(view.left(), expect)
    }

    func testRight() {
        var view: UIView
        var expect: CGFloat

        expect = 300.0
        view = UIView.init(frame: CGRect.init(x: 0, y: 0, width: 300, height: 200))
        XCTAssertEqual(view.right(), expect)

        expect = 230.0
        view = UIView.init(frame: CGRect.init(x: 50, y: 30, width: 180, height: 270))
        XCTAssertEqual(view.right(), expect)

        expect = 400.0
        view.right(expect)
        XCTAssertEqual(view.right(), expect)
    }

    func testTop() {
        var view: UIView
        var expect: CGFloat

        expect = 0.0
        view = UIView.init(frame: CGRect.init(x: 0, y: 0, width: 300, height: 200))
        XCTAssertEqual(view.top(), expect)

        expect = 30.0
        view = UIView.init(frame: CGRect.init(x: 50, y: 30, width: 180, height: 270))
        XCTAssertEqual(view.top(), expect)

        expect = 125.0
        view.top(expect)
        XCTAssertEqual(view.top(), expect)
    }

    func testBottom() {
        var view: UIView
        var expect: CGFloat

        expect = 200.0
        view = UIView.init(frame: CGRect.init(x: 0, y: 0, width: 300, height: 200))
        XCTAssertEqual(view.bottom(), expect)

        expect = 300.0
        view = UIView.init(frame: CGRect.init(x: 50, y: 30, width: 180, height: 270))
        XCTAssertEqual(view.bottom(), expect)

        expect = 365.0
        view.bottom(expect)
        XCTAssertEqual(view.bottom(), expect)
    }

    func testSize() {
        var view: UIView
        var expect: CGSize

        expect = CGSize.init(width: 300, height: 200)
        view = UIView.init(frame: CGRect.init(x: 0, y: 0, width: expect.width, height: expect.height))
        XCTAssertEqual(view.size(), expect)

        expect = CGSize.init(width: 180, height: 270)
        view = UIView.init(frame: CGRect.init(x: 50, y: 30, width: expect.width, height: expect.height))
        XCTAssertEqual(view.size(), expect)

        expect = CGSize.init(width: 50, height: 75)
        view.size(expect)
        XCTAssertEqual(view.size(), expect)
    }

    func testWidth() {
        var view: UIView
        var expect: CGFloat

        expect = 300.0
        view = UIView.init(frame: CGRect.init(x: 0, y: 0, width: expect, height: 200))
        XCTAssertEqual(view.width(), expect)

        expect = 180.0
        view = UIView.init(frame: CGRect.init(x: 50, y: 30, width: expect, height: 270))
        XCTAssertEqual(view.width(), expect)

        expect = 80.0
        view.width(expect)
        XCTAssertEqual(view.width(), expect)
    }

    func testHeight() {
        var view: UIView
        var expect: CGFloat

        expect = 200.0
        view = UIView.init(frame: CGRect.init(x: 0, y: 0, width: 300, height: expect))
        XCTAssertEqual(view.height(), expect)

        expect = 270.0
        view = UIView.init(frame: CGRect.init(x: 50, y: 30, width: 180, height: expect))
        XCTAssertEqual(view.height(), expect)

        expect = 70.0
        view.height(expect)
        XCTAssertEqual(view.height(), expect)
    }

    func testAddBorders() {
        var view: UIView
        var sublayers: [CALayer]?

        view = UIView(frame: CGRect(x: 0, y: 0, width: 300, height: 200))
        view.addBorders([.top, .left, .bottom], width: 1.0, color: .red)

        sublayers = view.layer.sublayers?.filter({ $0.name == UIView.BorderPosition.top.name })
        XCTAssertNotNil(sublayers)
        XCTAssertEqual(sublayers?.count, 1)
        XCTAssertEqual(sublayers?.first?.name, UIView.BorderPosition.top.name)
        XCTAssertEqual(sublayers?.first?.frame.height, 1.0)
        XCTAssertEqual(sublayers?.first?.backgroundColor, UIColor.red.cgColor)

        sublayers = view.layer.sublayers?.filter({ $0.name == UIView.BorderPosition.bottom.name })
        XCTAssertNotNil(sublayers)
        XCTAssertEqual(sublayers?.count, 1)
        XCTAssertEqual(sublayers?.first?.name, UIView.BorderPosition.bottom.name)
        XCTAssertEqual(sublayers?.first?.frame.height, 1.0)
        XCTAssertEqual(sublayers?.first?.backgroundColor, UIColor.red.cgColor)

        sublayers = view.layer.sublayers?.filter({ $0.name == UIView.BorderPosition.left.name })
        XCTAssertNotNil(sublayers)
        XCTAssertEqual(sublayers?.count, 1)
        XCTAssertEqual(sublayers?.first?.name, UIView.BorderPosition.left.name)
        XCTAssertEqual(sublayers?.first?.frame.width, 1.0)
        XCTAssertEqual(sublayers?.first?.backgroundColor, UIColor.red.cgColor)

        sublayers = view.layer.sublayers?.filter({ $0.name == UIView.BorderPosition.right.name })
        XCTAssertTrue(sublayers?.isEmpty ?? false)
    }

    func testAddBorder() {
        var view: UIView
        var sublayers: [CALayer]?

        view = UIView(frame: CGRect(x: 0, y: 0, width: 300, height: 200))
        view.addBorder(.top, width: 1.0, color: .gray)
        sublayers = view.layer.sublayers?.filter({ $0.name == UIView.BorderPosition.top.name })
        XCTAssertNotNil(sublayers)
        XCTAssertEqual(sublayers?.first?.name, UIView.BorderPosition.top.name)
        XCTAssertEqual(sublayers?.first?.frame.height, 1.0)
        XCTAssertEqual(sublayers?.first?.backgroundColor, UIColor.gray.cgColor)

        view.addBorder(.top, width: 1.0, color: .gray)
        sublayers = view.layer.sublayers?.filter({ $0.name == UIView.BorderPosition.top.name })
        XCTAssertEqual(sublayers?.count, 1)

        view.addBorder(.bottom, width: 1.0, color: .green)
        sublayers = view.layer.sublayers?.filter({ $0.name == UIView.BorderPosition.bottom.name })
        XCTAssertNotNil(sublayers)
        XCTAssertEqual(sublayers?.first?.name, UIView.BorderPosition.bottom.name)
        XCTAssertEqual(sublayers?.first?.frame.height, 1.0)
        XCTAssertEqual(sublayers?.first?.backgroundColor, UIColor.green.cgColor)

        view.addBorder(.left, width: 1.0, color: .red)
        sublayers = view.layer.sublayers?.filter({ $0.name == UIView.BorderPosition.left.name })
        XCTAssertNotNil(sublayers)
        XCTAssertEqual(sublayers?.first?.name, UIView.BorderPosition.left.name)
        XCTAssertEqual(sublayers?.first?.frame.width, 1.0)
        XCTAssertEqual(sublayers?.first?.backgroundColor, UIColor.red.cgColor)

        view.addBorder(.right, width: 1.0, color: .blue)
        sublayers = view.layer.sublayers?.filter({ $0.name == UIView.BorderPosition.right.name })
        XCTAssertNotNil(sublayers)
        XCTAssertEqual(sublayers?.first?.name, UIView.BorderPosition.right.name)
        XCTAssertEqual(sublayers?.first?.frame.width, 1.0)
        XCTAssertEqual(sublayers?.first?.backgroundColor, UIColor.blue.cgColor)
    }
}
