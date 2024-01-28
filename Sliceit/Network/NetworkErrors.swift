//
//  NetworkError.swift
//  Sliceit
//
//  Created by AK on 1/28/24.
//

import Foundation

enum APIError: String, Error {
    case jsonDecoding = "Could not decode value"
    case response = "Response is not correct"
    case noInternet = "No Internet Connection"
    case unknown = "Unnknown Error"
    

    
}
