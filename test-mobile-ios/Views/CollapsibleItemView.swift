//
//  CollapsibleItemView.swift
//  test-mobile-ios
//
//  Created by Otniela on 06.03.24.
//

import Foundation
import SwiftUI

import SwiftUI

struct CollapsibleView: View {
    @State private var isExpanded = false
    let label: String
    let accounts: [Account]
    
    var body: some View {
        VStack(alignment: .leading) {
            
                HStack {
                    Text(label)
                    Spacer()
                    Image(systemName: isExpanded ? "chevron.down" : "chevron.right")
                }
                .foregroundColor(.black)
                .onTapGesture {
                    self.isExpanded.toggle()
                }
                
                if isExpanded {
                        ForEach(accounts) { account in
                            NavigationLink(destination: DetailOperation(operations: account.recentOperationsFirst, accountTitle: account.label, accountAmount: "\(account.balance)")) {
                                VStack(alignment: .leading) {
                                    Text(account.label)
                                        .font(.headline)
                                    Text("Balance: \(account.balance) €")
                                        .font(.subheadline)
                                        .foregroundColor(.gray)
                                }
                            }
                        }
                }
            }
            .padding()
            .background(Color.white.opacity(0.1))
            .cornerRadius(10)
    }
}
