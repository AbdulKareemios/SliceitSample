//
//  LoginView.swift
//  Sliceit
//
//  Created by AK on 1/29/24.
//

import SwiftUI

struct LoginView: View {
    
    @ObservedObject var loginViewModel = LoginViewModel()
    @State private var isLoggedin: Bool = Auth.shared.loggedIn
    @State private var email: String = ""
    
    
    var body: some View {
        
        Form {
            //VStack {
            VStack {
                Image("dragonlogo")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 4))
                    .shadow(radius: 10)
                TextField(
                    "Enter Email", text: $loginViewModel.email, onCommit: {
                        if !isEmailValid(email: loginViewModel.email) {
                            loginViewModel.error = APIError.email
                        }
                    }
                ).errorAlert(error: $loginViewModel.error)
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                    .padding(.top, 20)
                    .keyboardType(.emailAddress)
                
                
                Divider()
                Text(
                    "We will never share your email with anyone else."
                ).frame(maxWidth: .infinity, alignment: .leading)
                    .font(.system(size: 10, weight: .medium, design: .default))
                
                SecureField(
                    "Enter Password",
                    text: $loginViewModel.password
                )
                .padding(.top, 20)
                .disableAutocorrection(true)
                .autocapitalization(.none)
                Divider()
                Spacer()
                Spacer()
                Button(
                    action: loginViewModel.login,
                    label: {
                        Text("Sign in")
                            .modifier(MainButton())
                    }
                )
                //Spacer()
            }.padding(50)
        }.navigate(to: ProfileView(), when: $isLoggedin)
    }
    
    func isEmailValid(email: String) -> Bool {
        // criteria in regex.  See http://regexlib.com
        var isvalid: Bool = false
        let emailTest = NSPredicate(format: "SELF MATCHES %@",
                                    "^([a-zA-Z0-9_\\-\\.]+)@((\\[[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\.)|(([a-zA-Z0-9\\-]+\\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\\]?)$")
        isvalid = emailTest.evaluate(with: email)
        if !isvalid {
            loginViewModel.error = APIError.email
        }
        return isvalid
    }
    struct LoginView_Previews: PreviewProvider {
        static var previews: some View {
            LoginView()
        }
    }
}
