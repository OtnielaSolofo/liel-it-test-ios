//
//  DetailOperation.swift
//  test-mobile-ios
//
//  Created by Otniela on 06.03.24.
//

import Foundation
import SwiftUI

struct DetailOperation: View {
    var operations: [Operation]
    var accountTitle: String
    var accountAmount: String
    
    var body: some View {
        VStack {
            
            VStack {
                Text(" \(accountAmount) €")
                    .bold()
                       .font(.system(size: 35))
                       .padding(.bottom, 25)
                Text(" \(accountTitle)")
                    .font(.system(size: 20))
                    .padding(.bottom, 20)
            }.frame(maxWidth: .infinity, alignment: .center)
            
            ForEach(operations) { operation in
               HStack(alignment: .center) {
                   VStack(alignment: .leading) {
                       Text(" \(operation.title)")
                       Text(" \(operation.date)")
                   }.padding(.leading, 10)
                       .padding(.bottom, 10)
                    Spacer()
                   Text(" \(operation.amount) €")
                       .padding(.trailing, 10)
               }
            }
            Spacer()
        }
    }
}
