//
//  DispatchQueue+ExtensionTests.swift
//  extensions
//
//  Created by shota.todoroki on 2019-05-07.
//  Copyright © 2019 shota_todoroki. All rights reserved.
//

import XCTest
@testable import extensions

class DispatchQueueExtensionTests: XCTestCase {

    private var counter = 0

    override func setUp() {
        counter = 0
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testDebounce() {
        let queue = DispatchQueue.global()
        let debounceAction = queue.debounce(delay: .milliseconds(100), action: countUp)

        debounceAction()  // cancel
        debounceAction()  // cancel
        Thread.sleep(forTimeInterval: 0.05)
        debounceAction()  // run
        Thread.sleep(forTimeInterval: 0.11)
        debounceAction()  // run

        // 値チェック前に action が発火するのを待つ
        Thread.sleep(forTimeInterval: 0.20)
        XCTAssertEqual(counter, 2)
    }

    func testThrottle() {
        let queue = DispatchQueue.global()
        let throttleAction = queue.throttle(delay: 0.1, action: countUp)

        throttleAction()  // run
        throttleAction()  // cancel
        Thread.sleep(forTimeInterval: 0.05)
        throttleAction()  // run
        Thread.sleep(forTimeInterval: 0.11)
        throttleAction()  // run

        // 値チェック前に action が発火するのを待つ
        Thread.sleep(forTimeInterval: 0.20)
        XCTAssertEqual(counter, 3)
    }

    private func countUp() {
        counter += 1
    }

}
