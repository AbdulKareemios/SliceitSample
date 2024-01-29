//
//  ProfileView.swift
//  Sliceit
//
//  Created by AK on 1/29/24.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        Button(action: Auth.shared.logout) {
            Text("Logout")
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
