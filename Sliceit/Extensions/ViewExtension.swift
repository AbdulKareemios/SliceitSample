//
//  ViewExtension.swift
//  Sliceit
//
//  Created by AK on 1/29/24.
//

import Foundation
import SwiftUI

extension View {
    func errorAlert(error: Binding<APIError?>, buttonTitle: String = "OK") -> some View {
        let localizedAlertError = LocalizedAlertError(error: (error.wrappedValue))
        
//        return alert(isPresented: .constant(true), error: localizedAlertError) { _ in
//            Button(buttonTitle) {
//                error.wrappedValue = nil
//            }
//        } message: { error in
//            Text(error.recoverySuggestion ?? APIError.unknown.rawValue)
//        }
        
        return alert("Failure", isPresented: .constant(error.wrappedValue != nil), presenting: error) { _ in
        } message: { error in
            Text(error.wrappedValue?.rawValue ?? APIError.unknown.rawValue)
        }
    }
    
    func navigate<NewView: View>(to view: NewView, when binding: Binding<Bool>) -> some View {
        NavigationView {
            ZStack {
                self
                    .navigationBarTitle("")
                    .navigationBarHidden(true)

                NavigationLink(
                    destination: view
                        .navigationBarTitle("")
                        .navigationBarHidden(true),
                    isActive: binding
                ) {
                    EmptyView()
                }
            }
        }
        .navigationViewStyle(.stack)
    }
}


