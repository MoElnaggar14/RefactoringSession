//
//  RefactoringAssignmentTests.swift
//  RefactoringAssignmentTests
//
//  Created by Mohammed Elnaggar on 2/3/20.
//  Copyright © 2020 LintSchool. All rights reserved.
//

import XCTest

class RefactoringAssignmentTests: XCTestCase {

    
    var sut: Customer! // tips: - Force it.
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut = Customer(name: "Ahmed")
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
    }

    func testReceiptExample() {
        // given
        sut.addFamilyRide(Ride(service: Service.uberBlack, kilometers: 300, time: 150, tolls: [5,4,6], isSurged: true, surgeRate: 1.5))
        sut.addFamilyRide(Ride(service: Service.uberX, kilometers: 200, time: 66, tolls: [5,6,6], isSurged: false, surgeRate: 0))
        sut.addFamilyRide(Ride(service: Service.chopper, kilometers: 160, time: 55, tolls: [5,4,6], isSurged: false, surgeRate: 0))
        sut.addFamilyRide(Ride(service: Service.uberBlack, kilometers: 3, time: 22, tolls: [5,6,6], isSurged: true, surgeRate: 1.4))
        sut.addFamilyRide(Ride(service: Service.uberX, kilometers: 200, time: 90, tolls: [5,4,6], isSurged: false, surgeRate: 0))
        sut.addFamilyRide(Ride(service: Service.chopper, kilometers: 140, time: 130, tolls: [5,6,6], isSurged: true, surgeRate: 1.3))
        
        // when
        let result = sut.receipt()
        let expectedResult = """
Receipt for:Ahmed
LE 23755.50
LE 6717.00
LE 11050.00
LE 3427.00
LE 9115.00
LE 26050.00
Amount owed is LE 80114.50, and 0.00 point\n
"""
        
        XCTAssertEqual(result, expectedResult, "Receipt not matched")
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
