//
//  ProfileViewModal.swift
//  Sliceit
//
//  Created by AK on 1/30/24.
//

import Foundation


class ProfileViewModel: ObservableObject {
    
    @Published var fullName: String = ""
    @Published var email: String = ""
    @Published var error: APIError?
    @Published var authorName = ""
    @Published var authorID = ""
    @Published var quote = ""
    
    func getProfile() {
        
        ProfileAction().call { [self] response in
            DispatchQueue.main.async {
                self.error = nil
                if let data = response.data {
                    self.fullName = data.fullname ?? ""
                    self.email = data.email ?? ""
                }
                else {
                    self.error = APIError.response
                }
            }
            
        } failure:  { error in
            DispatchQueue.main.async {
                self.error = error
            }
        }
    }
    
    func getAuthor() {
        
        AuthorAction().call { [self] response in
            DispatchQueue.main.async {
                self.error = nil
                if let data = response.data {
                    self.authorName = data.name ?? ""
                    self.authorID = String(data.authorId ?? 0)
                    self.getQuote(authorId: self.authorID)
                }
                else {
                    self.error = APIError.response
                }
            }
            
        } failure:  { error in
            DispatchQueue.main.async {
                self.error = error
            }
        }
    }
    
    func getQuote(authorId: String) {
        
        
        QuoteAction().call(authorId: authorId) { [self] response in
            
            DispatchQueue.main.async {
                self.error = nil
                if let data = response.data {
                    self.quote = data.quote ?? ""
                    
                }
                else {
                    self.error = APIError.response
                }
            }
            
        } failure:  { error in
            DispatchQueue.main.async {
                self.error = error
            }
        }
    }
}
