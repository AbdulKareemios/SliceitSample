//
//  AuthorAction.swift
//  Sliceit
//
//  Created by AK on 1/30/24.
//

import Foundation

struct AuthorAction {
    
    let path = "/author"
    let method: HTTPMethod = .get
    
    
    func call (
        completion: @escaping (AuthorResponse) -> Void,
        failure: @escaping (APIError) -> Void
    ) {
        
        let queryItems = URLQueryItem(name: "token", value: Auth.shared.getAccessToken())
        print("Author Request",queryItems)
        APIRequest<AuthorRequest, AuthorResponse>.call(
            path: path,
            method: method,
            queryItems: [queryItems]
        ) { data in
            if let response = try? JSONDecoder().decode(
                AuthorResponse.self,
                from: data
            ) {
                print("Author Response",response)
                completion(response)
            } else {
                failure(.jsonDecoding)
            }
        } failure: { error in
            failure(error) // Added this
        }
    }
}
