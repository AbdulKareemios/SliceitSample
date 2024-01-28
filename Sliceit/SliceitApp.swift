//
//  SliceitApp.swift
//  Sliceit
//
//  Created by AK on 1/27/24.
//

import SwiftUI

@main
struct SliceitApp: App {
    init() {
        NetworkMonitor.shared.startMonitoring()
    }
    var body: some Scene {
        WindowGroup {
            HomeView()
                
        }
    }
}
