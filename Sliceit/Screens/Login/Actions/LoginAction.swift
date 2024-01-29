//
//  LoginAction.swift
//  Sliceit
//
//  Created by AK on 1/29/24.
//

import Foundation


struct LoginAction {
    
    let path = "/login"
    let method: HTTPMethod = .post
    var parameters: LoginRequest
    
    func call(
        completion: @escaping (LoginResponse) -> Void,
        failure: @escaping (APIError) -> Void
    ) {
        print("Request",parameters)
        APIRequest<LoginRequest, LoginResponse>.call(
            path: path,
            method: .post,
            parameters: parameters
        ) { data in
            if let response = try? JSONDecoder().decode(
                LoginResponse.self,
                from: data
            ) {
                print("Response",response)
                completion(response)
            } else {
                failure(.jsonDecoding)
            }
        } failure: { error in
            failure(error) // Added this
        }
    }
    
    
}
