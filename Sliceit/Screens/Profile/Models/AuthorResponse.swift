//
//  AuthorResponse.swift
//  Sliceit
//
//  Created by AK on 1/30/24.
//

import Foundation

struct AuthorResponse: Codable {
    
    var success: Bool
    var data: AuthorResponseeData?
}
struct AuthorResponseeData: Codable {
    
    var authorId: Int?
    var name: String?
}

