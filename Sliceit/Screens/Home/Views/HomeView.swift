//
//  HomeView.swift
//  Sliceit
//
//  Created by AK on 1/27/24.
//

import SwiftUI

struct HomeView: View {
    
    @State private var showAboutUs = false
    @State private var signinActive = false
    @EnvironmentObject var auth: Auth
    
    var body: some View {
        NavigationView {
            VStack {
                Image("dragonlogo")
                .resizable()
                .frame(width: 200, height: 200)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.white, lineWidth: 4))
                .shadow(radius: 10)
                
                Text("Building the next-gen fintech")
                Button(
                    action: {
                        showAboutUs.toggle()
                    },
                    label: {
                        Text("About us")
                            .modifier(MainButton())
                    }
                )
                
                NavigationLink(destination: LoginView(), isActive: $signinActive) {
                    
                    Button(
                        action: {
                            self.signinActive = true
                        },
                        label: {
                            Text("Sign in")
                                .modifier(MainButton())
                        }
                    )
                }
            }
            .padding()
            .sheet(isPresented: $showAboutUs) {
                AboutUsView()
            }
            
        }.navigate(to: ProfileView(), when: $auth.loggedIn)
//        if auth.loggedIn {
//            NavigationLink(destination: ProfileView(), isActive: $auth.loggedIn) {
//                
//                Button(
//                    action: {
//                        self.signinActive = true
//                    },
//                    label: {
//                        Text("Sign in")
//                            .modifier(MainButton())
//                    }
//                )
//            }
//            
//        }
    }
    
    func launchAboutUs() {
        
        
    }
    
    func launchSignin() {
        
    }
        
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}



