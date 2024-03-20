//
//  ContentView.swift
//  test-mobile-ios
//
//  Created by Otniela on 06.03.24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var vm = BankViewModel()
       
       var body: some View {
           NavigationView {
               VStack {
                   if !vm.bankData.isEmpty {
                       VStack {
                           List {
                               Section(header: Text("Crédit Agricole")) {
                                   ForEach(vm.bankData.filter { $0.name == "CA Languedoc" }) { bank in
                                       VStack(alignment: .leading) {
                                           CollapsibleView(label: " \(bank.name)", accounts: bank.accounts)
                                       }
                                   }
                               }
                               
                               Section(header: Text("Autres banques")) {
                                   ForEach(vm.bankData.filter { $0.name != "CA Languedoc" }) { bank in
                                       VStack(alignment: .leading) {
                                           CollapsibleView(label: " \(bank.name)", accounts: bank.accounts)
                                       }
                                   }
                               }
                           }
                           .listStyle(GroupedListStyle())
                       }
                  } else {
                       Text("Loading...")
                   }
               }
               .onAppear {
                   vm.fetchData()
               }        .navigationTitle("Mes comptes")
                   }
       }
}

#Preview {
    ContentView()
}
