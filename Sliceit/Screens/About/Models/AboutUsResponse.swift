//
//  InfoResponse.swift
//  Sliceit
//
//  Created by AK on 1/28/24.
//

import Foundation


struct AboutUsResponse: Codable {
    
    var success: Bool
    var data: InfoResponseData?
    
}

struct InfoResponseData: Codable {
    
    var message: String?
}
