//
//  BankViewModel.swift
//  test-mobile-ios
//
//  Created by Otniela on 06.03.24.
//

import Foundation

class BankViewModel: ObservableObject {
    @Published var bankData: [Bank] = []
    let url: String = "https://cdf-test-mobile-default-rtdb.europe-west1.firebasedatabase.app/banks.json"

    let testData: String = """
[
    {
        "accounts": [
            {
                "balance": 2031.84,
                "contract_number": "32216549871",
                "holder": "Corinne Martin",
                "id": "151515151151",
                "label": "Compte de dépôt",
                "operations": [
                    {
                        "amount": "-15,99",
                        "category": "leisure",
                        "date": "1644870724",
                        "id": "2",
                        "title": "Prélèvement Netflix"
                    },
                    {
                        "amount": "-95,99",
                        "category": "online",
                        "date": "1644611558",
                        "id": "4",
                        "title": "CB Amazon"
                    }
                ],
                "order": 1,
                "product_code": "00004",
                "role": 1
            },
            {
                "balance": 843.15,
                "contract_number": "09320939231",
                "holder": "M. et Mme Martin",
                "id": "9892736780987654",
                "label": "Compte joint",
                "operations": [
                    {
                        "amount": "-15,99",
                        "category": "leisure",
                        "date": "1644784369",
                        "id": "2",
                        "title": "Prélèvement Netflix"
                    },
                    {
                        "amount": "-750,00",
                        "category": "housing",
                        "date": "1644179569",
                        "id": "3",
                        "title": "Prélèvement Century 21"
                    }
                ],
                "order": 2,
                "product_code": "00007",
                "role": 2
            },
            {
                "balance": 209.39,
                "contract_number": "29389382872",
                "holder": "Thaïs Martin",
                "id": "2354657678098765",
                "label": "Compte Mozaïc",
                "operations": [
                    {
                        "amount": "-15,99",
                        "category": "leisure",
                        "date": "1644438769",
                        "id": "2",
                        "title": "Orange"
                    }
                ],
                "order": 3,
                "product_code": "00007",
                "role": 6
            }
        ],
        "isCA": 1,
        "name": "CA Languedoc"
    },
    {
        "accounts": [
            {
                "balance": 45.84,
                "contract_number": "32216549871",
                "holder": "Corinne Martin",
                "id": "09878900000",
                "label": "Compte de dépôt",
                "operations": [
                    {
                        "amount": "-1,99",
                        "category": "costs",
                        "date": "1588690878",
                        "id": "2",
                        "title": "Tenue de compte"
                    },
                    {
                        "amount": "-1,99",
                        "category": "costs",
                        "date": "1641760369",
                        "id": "3",
                        "title": "Tenue de compte"
                    }
                ],
                "order": 1,
                "product_code": "00004",
                "role": 1
            }
        ],
        "isCA": 0,
        "name": "Boursorama"
    },
    {
        "accounts": [
            {
                "balance": 675.04,
                "contract_number": "32216549871",
                "holder": "Jean Martin",
                "id": "3982997777",
                "label": "Compte Chèques",
                "operations": [
                    {
                        "amount": "-1331,44",
                        "category": "costs",
                        "date": "1644179569",
                        "id": "2",
                        "title": "Prêt immo"
                    },
                    {
                        "amount": "-53,20",
                        "category": "food",
                        "date": "1644784369",
                        "id": "2",
                        "title": "CB La Vie Claire"
                    },
                    {
                        "amount": "-10,00",
                        "category": "leisure",
                        "date": "1644611558",
                        "id": "3",
                        "title": "Prélèvement Spotify"
                    },
                    {
                        "amount": "-53,00",
                        "category": "trip",
                        "date": "1644870724",
                        "id": "4",
                        "title": "CB Billets SNCF"
                    }
                ],
                "order": 1,
                "product_code": "00004",
                "role": 1
            }
        ],
        "isCA": 0,
        "name": "Banque Pop"
    },
    {
        "accounts": [
            {
                "balance": 425.84,
                "contract_number": "32216549871",
                "holder": "Corinne Martin",
                "id": "3982938",
                "label": "Compte de dépôt",
                "operations": [
                    {
                        "amount": "-1,99",
                        "category": "costs",
                        "date": "1644870724",
                        "id": "2",
                        "title": "Tenue de compte"
                    },
                    {
                        "amount": "-45,99",
                        "category": "leisure",
                        "date": "1644870724",
                        "id": "2",
                        "title": "Prélèvement Orange"
                    }
                ],
                "order": 1,
                "product_code": "00004",
                "role": 1
            }
        ],
        "isCA": 1,
        "name": "CA Centre-Est"
    }
]
"""
    
    func fetchData() {
           guard let url = URL(string: url) else {
               print("Invalid URL")
               return
           }
           
           URLSession.shared.dataTask(with: url) { data, _, error in
               if let data = data {
                   do {
                       let decodedData = try JSONDecoder().decode([Bank].self, from: data)
                       DispatchQueue.main.async {
                           self.bankData = decodedData.sorted { $0.name < $1.name }
                       }
                   } catch {
                       print("Error decoding JSON: \(error)")
                   }
               } else {
                   print("No data received: \(error?.localizedDescription ?? "Unknown error")")
               }
           }.resume()
        
        
//        if let jsonData = testData.data(using: .utf8) {
//            do {
//                let bankData = try JSONDecoder().decode([Bank].self, from: jsonData)
//                self.bankData = bankData.sorted { $0.name < $1.name }
//            } catch {
//                print("Error decoding JSON:", error)
//            }
//        } else {
//            print("Error converting string to data")
//        }
       }
}
