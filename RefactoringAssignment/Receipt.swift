//
//  Receipt.swift
//  RefactoringAssignment
//
//  Created by Mohammed Elnaggar on 2/10/20.
//  Copyright © 2020 LintSchool. All rights reserved.
//

import Foundation

protocol ReceiptDelegate: class {
    func print(receipt: Receipt) -> String
}

class FinalReceipt: ReceiptDelegate {
    func print(receipt: Receipt) -> String {
        let name = "Receipt for: \(receipt.customerName)"
        let totalAmount = receipt.amountPerRide.map({ String(format: "LE %.2f", $0) }).joined(separator: "\n")
        let totalPoints = String(format: "Amount owed is LE %.2f, and %.2f point\n", receipt.totalAmount, receipt.totalPoints)
        return [name, totalAmount, totalPoints].joined(separator: "\n")
    }
}

struct Receipt {
    let customerName: String
    let amountPerRide: [Double]
    let totalAmount: Double
    let totalPoints: Double
}
