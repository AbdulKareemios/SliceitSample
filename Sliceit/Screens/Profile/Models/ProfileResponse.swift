//
//  ProfileResponse.swift
//  Sliceit
//
//  Created by AK on 1/30/24.
//

import Foundation


struct ProfileResponse: Codable {
    
    var success: Bool
    var data: ProfileResponseData?
}

struct ProfileResponseData: Codable {
    
    var fullname: String?
    var email: String?
}
