//
//  WeatherButton.swift
//  SwiftUI-WeatherApp
//
//  Created by Z.K   on 23/05/2026.
//

import SwiftUI

struct WeatherButton: View {
    
    var title: String
    var textColor: Color
    var backgroundColor: Color
    
    var body: some View {
        Text(title)
            .frame(width: 280, height: 50)
            .background(backgroundColor.gradient)
            .foregroundColor(textColor)
            .font(.system(size: 20,
                          weight: .bold,
                          design: .default))
            .cornerRadius(10)
    }
}

