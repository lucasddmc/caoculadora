//
//  Size.swift
//  Caoculadora
//
//  Created by Lucas Dantas de Moura Carvalho on 10/05/24.
//

import Foundation


enum Size: String, CaseIterable {
    case small = "Pequeno"
    case medium = "Médio"
    case large = "Grande"
    
    func ageConversion(years: Int, months: Int) -> Int {
        let result: Int
        let multiplier: Int
        
        switch self {
        case .small:
            multiplier = 6
        case .medium:
            multiplier = 7
        case .large:
            multiplier = 8
        }
        
        result = years * multiplier + months * multiplier / 12
        
        return result
    }
}
