//
//  Models.swift
//  Sliceit
//
//  Created by AK on 1/28/24.
//

import Foundation

struct Credentials {
    var accessToken: String?
    var refreshToken: String?
}

enum KeychainKey: String {
    case accessToken
    case refreshToken
}
