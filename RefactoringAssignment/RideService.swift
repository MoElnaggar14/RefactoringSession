//
//  RideService.swift
//  RefactoringAssignment
//
//  Created by Mohammed Elnaggar on 2/10/20.
//  Copyright © 2020 LintSchool. All rights reserved.
//

import Foundation

enum ServiceType {
    case uberX
    case uberBlack
    case chopper
}


protocol RideService {
    var intialFees: Double { get set }
    var time: Int { get set }
    var kilometers: Int { get set }
    var tolls: [Int]? { get set }
    var isSurged: Bool? { get set }
    var surgeRate: Double { get set }
    
    var isPopular: Bool { get set }
    var maxUsers: Int { get set }
    
    func applyTimePrice(_ time: Int) -> Double
    func applyExtraFees() -> Double
    func applyExtraKilomters(_ time: Int, _ kilometers: Int) -> Double
    func addTolls(_ tolls: [Int]) -> Double
    func applySurgRate(_ isSurged: Bool, rate: Double) -> Double
    
    func applyBasePoints(_ rideAmount: Double) -> Double
    func applySurgePoints(_ isSurged: Bool, rate: Double) -> Double
    func applyExtraPointsForServiceType(_ totalPoints: Double) -> Double
}
