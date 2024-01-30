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

struct SecondaryButton: ViewModifier {
    var color: Color = Color(red: 200/255, green: 57/255, blue: 148/255)
    
    func body(content: Content) -> some View {
        content
            .font(.system(size: 20, weight: .semibold, design: .default))
            .frame(maxWidth: .infinity, maxHeight: 40)
            .foregroundColor(Color.white)
            .background(color)
            .cornerRadius(5)
    }
}

struct SmallButton: ViewModifier {
    var color: Color = Color(red: 102/255, green: 81/255, blue: 156/255)
    
    func body(content: Content) -> some View {
        content
            .font(.system(size: 20, weight: .semibold, design: .default))
            .frame(maxWidth: 150, maxHeight: 50)
            .foregroundColor(Color.white)
            .background(color)
            .cornerRadius(5)
    }
}

struct NavigationButton: ViewModifier {
    var color: Color = Color(red: 200/255, green: 57/255, blue: 148/255)
    
    func body(content: Content) -> some View {
        content
            .font(.system(size: 20, weight: .semibold, design: .default))
            .frame(maxWidth: .infinity, maxHeight: 40)
            .foregroundColor(color)
            //.background(color)
            .cornerRadius(5)
    }
}
