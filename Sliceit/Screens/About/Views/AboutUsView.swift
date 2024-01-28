//
//  HomeView.swift
//  Sliceit
//
//  Created by AK on 1/28/24.
//

import SwiftUI
import Foundation

struct AboutUsView: View {
    @ObservedObject var aboutusViewModel = AboutUsViewModel()
    //@State private var showingAlert: Bool
    init() {
        aboutusViewModel.getInfo()
        
    }
    
    var body: some View {
        NavigationView {
            
            VStack(alignment: .trailing) {
                Text(aboutusViewModel.companyInfo)
            }
            .navigationTitle("About us")
            .navigationBarTitleDisplayMode(.large)
        }.errorAlert(error: $aboutusViewModel.error)
    }
}

struct AboutUsView_Previews: PreviewProvider {
    static var previews: some View {
        AboutUsView()
        
    }
    
    
}
