//
//  NetworkError.swift
//  Sliceit
//
//  Created by AK on 1/28/24.
//

import Foundation

enum APIError: String, Error {
    case jsonDecoding
    case response
    case noInternet
}
