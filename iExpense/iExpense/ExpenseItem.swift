//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Angel Terziev on 25.06.22.
//

import Foundation

struct ExpenseItem : Identifiable, Codable {
    var id = UUID()
    let name: String
    let type: String
    let amount: Double
}
