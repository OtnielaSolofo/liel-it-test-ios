//
//  Bank.swift
//  test-mobile-ios
//
//  Created by Otniela on 06.03.24.
//

import Foundation

struct Bank: Decodable, Identifiable {
    let id = UUID()
    let name: String
    let isCA: Int
    let accounts: [Account]
}
