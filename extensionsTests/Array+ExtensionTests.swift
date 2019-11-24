//
// Created by shota_todoroki on 2018/01/21.
// Copyright (c) 2018 shota_todoroki. All rights reserved.
//

import XCTest

@testable import extensions

class ArrayExtensionTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testIsNotEmpty() {
        XCTAssertTrue([1, 2, 3].isNotEmpty)
        XCTAssertFalse([].isNotEmpty)
    }

    func testSortAsc() {
        var array, expectedArray: [Int]

        array = [3, 1, 2, 4, 0]
        expectedArray = [0, 1, 2, 3, 4]
        XCTAssertEqual(array.sortAsc(), expectedArray)

        array = [3, 1, 2, 4, 2]
        expectedArray = [1, 2, 2, 3, 4]
        XCTAssertEqual(array.sortAsc(), expectedArray)
    }

    func testSortDesc() {
        var array, expectedArray: [Int]

        array = [3, 1, 2, 4, 0]
        expectedArray = [4, 3, 2, 1, 0]
        XCTAssertEqual(array.sortDesc(), expectedArray)

        array = [3, 1, 2, 4, 2]
        expectedArray = [4, 3, 2, 2, 1]
        XCTAssertEqual(array.sortDesc(), expectedArray)
    }

    func testRemove() {
        var array, expectedArray: [Int]

        expectedArray = [3, 1, 4, 0, 2]
        array = [3, 1, 2, 4, 0, 2]
        array.removeFirst(element: 2)
        XCTAssertEqual(array, expectedArray)

        expectedArray = [3, 1, 4, 0]
        array = [3, 1, 2, 4, 0, 2]
        array.remove(element: 2)
        XCTAssertEqual(array, expectedArray)

        expectedArray = [3, 1, 2, 4, 0]
        array = [3, 1, 2, 4, 0]
        array.remove(element: 10)
        XCTAssertEqual(array, expectedArray)
    }

    func testUnique() {
        var array, expectedArray: [Int]

        expectedArray = [3, 1, 2, 4, 0]
        array = [3, 1, 2, 4, 0, 2]
        array.unique()
        XCTAssertEqual(array, expectedArray)

        expectedArray = [3, 1, 4, 0, 2]
        array = [3, 1, 4, 0, 2]
        array.unique()
        XCTAssertEqual(array, expectedArray)

        expectedArray = [5]
        array = [5, 5, 5, 5, 5]
        array.unique()
        XCTAssertEqual(array, expectedArray)
    }

}
