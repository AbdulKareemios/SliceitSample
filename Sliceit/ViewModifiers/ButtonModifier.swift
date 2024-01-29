//
//  ButtonModifier.swift
//  Sliceit
//
//  Created by AK on 1/28/24.
//

import SwiftUI


struct MainButton: ViewModifier {
    var color: Color = Color(red: 200/255, green: 57/255, blue: 148/255)
    
    func body(content: Content) -> some View {
        content
            .font(.system(size: 24, weight: .bold, design: .default))
            .frame(maxWidth: .infinity, maxHeight: 60)
            .foregroundColor(Color.white)
            .background(color)
            .cornerRadius(10)
    }
}
