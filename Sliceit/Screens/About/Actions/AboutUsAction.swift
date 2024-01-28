//
//  HomeAction.swift
//  Sliceit
//
//  Created by AK on 1/28/24.
//

import Foundation


struct AboutUsAction {
    
    let path = "/info"
    let method: HTTPMethod = .get
    
    func call (completion: @escaping (AboutUsResponse) -> Void,failure: @escaping (APIError) -> Void
    ) {
        APIRequest<AboutUsResponse>.call (
            path: path,
            method: method
        ) { data in
            print("response", data)
            do {
                let response = try JSONDecoder().decode(AboutUsResponse.self, from: data)
                completion(response)
            }
            catch {
                failure(.jsonDecoding)
            }
        } failure: { error in
            failure(error)
        }
    }
}
