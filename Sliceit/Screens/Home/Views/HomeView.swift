//
//  HomeView.swift
//  Sliceit
//
//  Created by AK on 1/27/24.
//

import SwiftUI

struct HomeView: View {
    
    @State private var showAboutUs = false
    
    var body: some View {
        //NavigationView {
            VStack {
                Image("dragonlogo")
                .resizable()
                .frame(width: 200, height: 200)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.white, lineWidth: 4))
                .shadow(radius: 10)
                
                Text("Building the next-gen fintech")
                Button(
                    action: launchAboutUs,
                    label: {
                        Text("About us")
                            .modifier(MainButton())
                    }
                )
                
                Button(
                    action: launchSignin,
                    label: {
                        Text("Sign in")
                            .modifier(MainButton())
                    }
                )
            }
            .padding()
            .sheet(isPresented: $showAboutUs) {
                AboutUsView()
            }
//            .navigationTitle("")
//            .navigationBarTitleDisplayMode(.large)
//        }
    }
    
    func launchAboutUs() {
        
        showAboutUs.toggle()
    }
    
    func launchSignin() {
        
    }
        
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}



