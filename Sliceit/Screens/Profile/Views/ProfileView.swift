//
//  ProfileView.swift
//  Sliceit
//
//  Created by AK on 1/29/24.
//

import SwiftUI

struct ProfileView: View {
    @State private var showAboutUs = false
    @ObservedObject var profileViewModel = ProfileViewModel()
    @State private var isLoading = false
    init() {
        profileViewModel.getProfile()
    }
    var body: some View {
        
        NavigationView {
            Form {
                VStack {
                    Spacer(minLength: 50)
                    HStack {
                        Image("dragonlogo")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.white, lineWidth: 4))
                        .shadow(radius: 10)
                        Spacer(minLength: 20)
                            
                        VStack {
                            Text(
                                "Welcome, " + profileViewModel.fullName
                            ).frame(maxWidth: .infinity, alignment: .leading)
                                .font(.system(size: 24, weight: .medium, design: .default))
                            
                            Button(
                                action: {fetchAuthorQoute()},
                                label: {
                                    Text("Update")
                                        .modifier(SecondaryButton())
                                }
                            )
                        }
                        
                    }
                    Spacer(minLength: 100)
                    //Form {
                        VStack {
                            
                                Text(
                                    profileViewModel.quote.isEmpty ? "Requesting the quote..." : ""
                                ).frame(maxWidth: .infinity, alignment: .leading)
                                    .font(.system(size: 20, weight: .medium, design: .default))
                                //                            Button(
                                //                                action: {},
                                //                                label: {
                                //                                    Text("Cancel")
                                //                                        .modifier(SmallButton())
                                //                                }
                                //                            )
                            
                            Spacer(minLength: 100)
                            Text(
                                profileViewModel.authorName + "," + profileViewModel.quote
                            ).frame(maxWidth: .infinity, alignment: .leading)
                                .font(.system(size: 14, weight: .medium, design: .default))
                                .fixedSize(horizontal: false, vertical: true)
                            Spacer(minLength: 50)
                        }
                    //}
                }
              
            }
            .navigationTitle("Profile")
            .toolbar {
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    
                    Button(
                        action: {Auth.shared.logout()}, label: {Text("Logout").modifier(NavigationButton())}
                    )
                }
                
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(
                        action:{showAboutUs.toggle()} , label: {Text("About us").modifier(NavigationButton())}
                    )
                }
            }
            
        }
        .sheet(isPresented: $showAboutUs) {
            AboutUsView()
        }
    }
    
    func fetchAuthorQoute() {
         profileViewModel.getAuthor()
            
    }
    
    func cancelRequest() {
        
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
