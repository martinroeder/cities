//
//  citiesTests.swift
//  citiesTests
//
//  Created by Martin Roeder on 1/16/19.
//  Copyright © 2019 Martin Roeder. All rights reserved.
//

import XCTest
@testable import cities

class citiesDataTests: XCTestCase {

    let data = CityData()

    func testCityDataExists() {
        XCTAssert(data.listOfCities.count > 0)
    }

    func testFilterEmptyString() {
        let filteredCount = data.filter(by: "").count
        XCTAssert(filteredCount == data.listOfCities.count)
    }

    func testFilterSpecialChar() {
        XCTAssert(data.filter(by: "\n").count == 0)
    }

    func testCityNotFound() {
        XCTAssert(data.filter(by: "THISCITYDOESNOTEXIST").count == 0)
    }

    func testPartialMatch() {
        let matchesOneChar = data.filter(by: "c").count
        let matchesTwoChar = data.filter(by: "ch").count

        XCTAssert(matchesOneChar > 0)
        XCTAssert(matchesTwoChar > 0)
        XCTAssert(matchesOneChar > matchesTwoChar)
    }
}
