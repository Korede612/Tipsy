//
//  TipsBrain.swift
//  Tipsy
//
//  Created by Oko-osi Korede on 29/01/2024.
//

import Foundation

struct TipsBrain {
    
    var tips: Tips?
    
    mutating func calculateTipsPerPerson(n: Float, a: Float, p: Float) {
        let amountTip = ((a * p) + a) / n
        tips = Tips(amount: a, numberOfPeople: n, percentage: p, tipsPerPerson: amountTip)
    }
    
    func getTipsPerPerson() -> String {
        guard let tipsPerPerson = tips?.tipsPerPerson else {
            return "0.00"
        }
        return String(format: "%.2f", tipsPerPerson)
    }
    
    func getTipsInfo() -> String {
        guard let numberOfPeople = tips?.numberOfPeople, 
                let percentage = tips?.percentage else {
            return "Error"
        }
        return "Split between \(Int(numberOfPeople)) people, with \(Int(percentage * 100))% tip."
    }
}
