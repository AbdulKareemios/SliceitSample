//
//  LoginViewModel.swift
//  Sliceit
//
//  Created by AK on 1/29/24.
//

import Foundation


class LoginViewModel: ObservableObject {
    
    @Published var email: String = "aleksei@sliceit.ai"
    @Published var password: String = "lkJlkn8hj"
    @Published var error: APIError?
    
    func login() {
        
        guard !email.isEmpty && !password.isEmpty else {
            
            return
        }
        LoginAction(
            parameters: LoginRequest(
                email: email,
                password: password
            )
        ).call { response in
            DispatchQueue.main.async {
                self.error = nil
            }
            
            
            Auth.shared.setCredentials(
                accessToken: response.data.token,
                refreshToken: response.data.token
            )
            
        } failure: { error in
            DispatchQueue.main.async {
                self.error = error
            }
        }
    }
}
