//
//  RootScreen.swift
//  Sliceit
//
//  Created by AK on 1/29/24.
//

import SwiftUI

struct RootScreen: View {
    @EnvironmentObject var auth: Auth
    
    var body: some View {
        //if auth.loggedIn {
            //ProfileView()
            HomeView()
//        } else {
//            HomeView()
//        }
    }
}

struct RootScreen_Previews: PreviewProvider {
    static var previews: some View {
        RootScreen()
    }
}
