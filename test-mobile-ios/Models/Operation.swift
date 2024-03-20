//
//  Operations.swift
//  test-mobile-ios
//
//  Created by Otniela on 06.03.24.
//

import Foundation

struct Operation: Decodable, Identifiable {
    let id: String
    let amount: String
    let category: String
    let date: String
    let title: String
}
