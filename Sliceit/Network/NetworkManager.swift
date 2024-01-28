//
//  NetworkManager.swift
//  Sliceit
//
//  Created by AK on 1/28/24.
//

import Foundation


typealias CompletionHandler = (Data) -> Void
typealias FailureHandler = (APIError) -> Void

struct EmptyRequest: Codable {}
struct EmptyResponse: Codable {}

enum HTTPMethod: String {
    case get
    case put
    case delete
    case post
}

class APIRequest<Model: Codable> {
    
    static func call(
    
        scheme: String = APIConfig.shared.scheme,
        host: String = APIConfig.shared.host,
        path: String,
        method: HTTPMethod,
        authorized: Bool = false,
        queryItems: [URLQueryItem]? = nil,
        //parameters: Parameters? = nil,
        completion: @escaping CompletionHandler,
        failure: @escaping FailureHandler
    ) {
        
        if !NetworkMonitor.shared.isReachable {
            return failure(.noInternet)
        }
        
        var components = URLComponents()
        components.scheme = scheme
        components.host = host
        components.path = path
        
        if let queryItems = queryItems {
            components.queryItems = queryItems
        }
        
        guard let url = components.url else {
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        
        
//        if let parameters = parameters {
//            request.httpBody = try? JSONEncoder().encode(parameters)
//        }
    
        if authorized, let token = Auth.shared.getAccessToken() {
            request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        }
        print("request",request);
        let task = URLSession.shared.dataTask(with: request) { data, _, error in
            
            if let data = data {
                completion(data)
            } else {
                if error != nil {
                    failure(APIError.response)
                }
            }
        }
        task.resume()
    }
}
