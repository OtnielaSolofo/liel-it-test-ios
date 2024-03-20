//
//  Accounts.swift
//  test-mobile-ios
//
//  Created by Otniela on 06.03.24.
//

import Foundation

//struct Account: Identifiable, Codable {
//    let order: Int
////    let id: String
////    let holder: String
//    let role: Int
////    let contract_number: String
////    let label: String
//    let product_code: String
////    let balance: Double
////    let operations:  [Operation]
//}


struct Account: Decodable, Identifiable {
    let id: String
    let contract_number: String
    let holder: String
    let label: String
    let balance: Double
    let operations: [Operation]
    
    let order: Int
    let role: Int
    let product_code: String
    
    var recentOperationsFirst: [Operation] {
       return operations.sorted(by: { (op1, op2) in
           if op1.date != op2.date {
               return op1.date > op2.date
           } else {
               return op1.title < op2.title
           }
       })
   }
}
