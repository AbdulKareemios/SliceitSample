//
//  LoginResponse.swift
//  Sliceit
//
//  Created by AK on 1/29/24.
//

import Foundation


struct LoginResponse: Codable {
    var success: Bool
    let data: LoginResponseData
}

struct LoginResponseData: Codable {
    let token: String
}
