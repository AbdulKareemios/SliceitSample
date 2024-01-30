//
//  QuoteActionn.swift
//  Sliceit
//
//  Created by AK on 1/30/24.
//

import Foundation


struct QuoteAction {
    
    let path = "/quote"
    let method: HTTPMethod = .get
    
    
    func call (authorId: String, completion: @escaping (QuoteResponse) -> Void,failure: @escaping (APIError) -> Void) {
        
        let tokenQuery = URLQueryItem(name: "token", value: Auth.shared.getAccessToken())
        let authorIDQuery = URLQueryItem(name: "authorid", value: authorId)
        
        let queryItems = [tokenQuery, authorIDQuery]
        print("Quote Request",queryItems)
        APIRequest<QuoteRequest, QuoteResponse>.call(
            path: path,
            method: method,
            queryItems: queryItems
        ) { data in
            if let response = try? JSONDecoder().decode(
                QuoteResponse.self,
                from: data
            ) {
                print("Quote Response",response)
                completion(response)
            } else {
                failure(.jsonDecoding)
            }
        } failure: { error in
            failure(error)
        }
    }
}
