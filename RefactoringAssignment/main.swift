//
//  main.swift
//  RefactoringAssignment
//
//  Created by Ahmed Meguid on 1/30/20.
//  Copyright © 2020 LintSchool. All rights reserved.
//

import Foundation

let customer = Customer(name: "Ahmed", FinalReceipt())

customer.addFamilyRide(Ride(serviceType: .uberBlack, time: 150, kilometers: 300, tolls: [5,4,6], isSurged: true, surgeRate: 1.5))
customer.addFamilyRide(Ride(serviceType: .uberX, time: 66, kilometers: 200, tolls: [5,6,6], isSurged: false, surgeRate: 0))
customer.addFamilyRide(Ride(serviceType: .chopper, time: 55, kilometers: 160, tolls: [5,4,6], isSurged: false, surgeRate: 0))
customer.addFamilyRide(Ride(serviceType: .uberBlack, time: 22, kilometers: 3, tolls: [5,6,6], isSurged: true, surgeRate: 1.4))
customer.addFamilyRide(Ride(serviceType: .uberX, time: 90, kilometers: 200, tolls: [5,4,6], isSurged: false, surgeRate: 0))
customer.addFamilyRide(Ride(serviceType: .chopper, time: 130, kilometers: 140, tolls: [5,6,6], isSurged: true, surgeRate: 1.3))

print(customer.receipt())

// it should be
/*
 Receipt for: Ahmed
 LE 23755.50
 LE 6717.00
 LE 11050.00
 LE 3427.00
 LE 9115.00
 LE 26050.00
 Amount owed is LE 80114.50, and 8025.45 point
 */
