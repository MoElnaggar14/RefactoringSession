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
        sut = Customer(name: "Ahmed", FinalReceipt())
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
    }

    func testReceiptExample() {
        // given
        sut.addFamilyRide(Ride(serviceType: .uberBlack, time: 150, kilometers: 300, tolls: [5,4,6], isSurged: true, surgeRate: 1.5))
        sut.addFamilyRide(Ride(serviceType: .uberX, time: 66, kilometers: 200, tolls: [5,6,6], isSurged: false, surgeRate: 0))
        sut.addFamilyRide(Ride(serviceType: .chopper, time: 55, kilometers: 160, tolls: [5,4,6], isSurged: false, surgeRate: 0))
        sut.addFamilyRide(Ride(serviceType: .uberBlack, time: 22, kilometers: 3, tolls: [5,6,6], isSurged: true, surgeRate: 1.4))
        sut.addFamilyRide(Ride(serviceType: .uberX, time: 90, kilometers: 200, tolls: [5,4,6], isSurged: false, surgeRate: 0))
        sut.addFamilyRide(Ride(serviceType: .chopper, time: 130, kilometers: 140, tolls: [5,6,6], isSurged: true, surgeRate: 1.3))
        
        // when
        let result = sut.receipt()
        let expectedResult = """
Receipt for: Ahmed
LE 22625.00
LE 6717.00
LE 11050.00
LE 3427.00
LE 9115.00
LE 26050.00
Amount owed is LE 78984.00, and 7912.40 point\n
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
