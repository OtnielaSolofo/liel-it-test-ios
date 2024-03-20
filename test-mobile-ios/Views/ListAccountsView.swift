//
//  InnerView.swift
//  test-mobile-ios
//
//  Created by Otniela on 06.03.24.
//

import Foundation
import SwiftUI

struct ListAccountsView: View {
    let accounts: [Account]
    
    var body: some View {
        VStack {
            ForEach(accounts) { account in
                NavigationLink(destination: DetailOperation(operations: account.operations, accountTitle: account.label, accountAmount: "\(account.balance)")) {
                    HStack(alignment: .center) {
                        Text(" \(account.label)")
                        Spacer()
                        Text(" \(account.balance) €")
                    }
                }
            }
        }
    }
}
