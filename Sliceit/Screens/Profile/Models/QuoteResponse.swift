//
//  QuoteAction.swift
//  Sliceit
//
//  Created by AK on 1/30/24.
//

import Foundation


struct QuoteResponse: Codable {
        
    var success: Bool
    var data: QuoteResponseeData?
}

struct QuoteResponseeData: Codable {
    
    var authorId: Int?
    var quoteId: Int?
    var quote: String?
}
