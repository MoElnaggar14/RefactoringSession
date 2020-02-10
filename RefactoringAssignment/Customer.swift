//
//  Customer.swift
//  RefactoringAssignment
//
//  Created by Ahmed Meguid on 1/30/20.
//  Copyright © 2020 LintSchool. All rights reserved.
//

import Foundation
 
class Customer {
    
    var name: String
    
    var receiptDelegate: ReceiptDelegate
    
    var familyRides: [Ride]
    
    
    init(name:String, _ delegate: ReceiptDelegate) {
        self.name = name
        receiptDelegate = delegate
        familyRides = []
    }
    
    func addFamilyRide(_ ride: Ride) {
        familyRides.append(ride)
    }
    
    func receipt() -> String {
        
        var totalAmount : Double = 0.0
        var totalPoints : Double = 0.0
        var amountPerRide = [Double]()

        familyRides.forEach { ride in
            let rideAmout = ride.calculateRideAmount()
            let ridePoints = ride.calculatePoints()
            
            totalAmount += rideAmout
            totalPoints += ridePoints
            
            amountPerRide.append(rideAmout)
        }
                
        return receiptDelegate.print(receipt: Receipt(customerName: name, amountPerRide: amountPerRide, totalAmount: totalAmount, totalPoints: totalPoints))
    }
}

class Ride: RideService {
    
    var serviceType: ServiceType
    
    var intialFees: Double = 50
    
    var time: Int
    
    var kilometers: Int
    
    var tolls: [Int]?
    
    var isSurged: Bool?
    
    var surgeRate: Double
    
    var isPopular: Bool = true
    
    var maxUsers: Int = 4
    
    
    init(serviceType: ServiceType, time: Int, kilometers: Int, tolls: [Int], isSurged: Bool, surgeRate: Double) {
        self.serviceType = serviceType
        self.time = time
        self.kilometers = kilometers
        self.tolls = tolls
        self.isSurged = isSurged
        self.surgeRate = surgeRate
    }
    
    
    func calculateRideAmount() -> Double {
        var rideAmount = intialFees
        rideAmount += applyTimePrice(time)
        rideAmount += applyExtraFees()
        rideAmount += applyExtraKilometers(time, kilometers)
        rideAmount += rideAmount * applyExtraKilometersLimits(time, kilometers)
        rideAmount += addTolls(tolls ?? [])
        rideAmount += applySurgRate(isSurged ?? false, rate: surgeRate)
        return rideAmount
    }
    
    func calculatePoints() -> Double {
        var points = 0.0
        points += applyBasePoints(calculateRideAmount())
        points += applySurgePoints(isSurged ?? false, rate: surgeRate)
        points += applyExtraPointsForServiceType(points)
        return points
    }
    
    func applyTimePrice(_ time: Int) -> Double {
        switch serviceType {
            
        case .uberX:
            return Double(100 * time)
        case .uberBlack:
            return Double(150 * time) 
        case .chopper:
            return Double(200 * time) 
        }
    }
    
    func applyExtraFees() -> Double {
        switch serviceType {
        case .uberX:
            return 50
        case .uberBlack:
            return 60
        case .chopper:
            return 0
        }
    }
    
    func applyExtraKilometers(_ time: Int, _ kilometers: Int) -> Double {
        switch serviceType {
        case .uberX:
            return kilometers > time * 50 ? Double((kilometers - time * 50) * 2) : 0
        case .uberBlack:
            return kilometers > time * 70 ? Double((kilometers - time * 70) * 2) : 0
        case .chopper:
            return 0
            
        }
    }
    
    func applyExtraKilometersLimits(_ time: Int, _ kilometers: Int) -> Double {
        guard kilometers > 200 else { return 0 }
        
        switch serviceType {
        case .uberX:
            return 0.05
        case .uberBlack:
            return time > 120 ? 0.05 : 0
        case .chopper:
            return 0
        }
        
    }
    
    func addTolls(_ tolls: [Int]) -> Double {  
        switch serviceType {
        case .uberX, .uberBlack:
            return Double(tolls.reduce(0, +))
        case .chopper:
            return 0
        }
    }
    
    func applySurgRate(_ isSurged: Bool, rate: Double) -> Double {
        guard isSurged else { return 0 }
        switch serviceType {
        case .uberX:
            return rate
        case .uberBlack, .chopper:
            return 0
        }
    }
    
    func applyBasePoints(_ rideAmount: Double) -> Double {
        return rideAmount / 10
    }
    
    func applySurgePoints(_ isSurged: Bool, rate: Double) -> Double {
        guard isSurged else { return 0 }
        switch serviceType {
        case .uberX:
            return rate * 10 - 10
        case .uberBlack, .chopper:
            return 0
        }
    }
    
    func applyExtraPointsForServiceType(_ totalPoints: Double) -> Double {
        switch serviceType {
        case .uberX:
            return 0
        case .uberBlack:
            return 5
        case .chopper:
            return 2
        }
    }
}
