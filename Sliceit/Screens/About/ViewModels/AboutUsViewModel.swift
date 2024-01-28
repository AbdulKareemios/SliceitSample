//
//  InfoViewModel.swift
//  Sliceit
//
//  Created by AK on 1/28/24.
//

import Foundation


class AboutUsViewModel: ObservableObject {
    
    @Published var companyInfo: String = ""
    @Published var error: APIError?
    
    func getInfo() {
        
        AboutUsAction().call { [self] response in
            DispatchQueue.main.async {
                self.error = nil
                if let data = response.data {
                    self.companyInfo = data.message ?? ""
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
