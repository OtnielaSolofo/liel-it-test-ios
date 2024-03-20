//
//  Abb.swift
//  test-mobile-ios
//
//  Created by Otniela on 06.03.24.
//

import Foundation

enum NetworkError: Error {
    case badUrl
    case invalidRequest
    case badResponse
    case badStatus
    case failedToDecodeResponse
}
