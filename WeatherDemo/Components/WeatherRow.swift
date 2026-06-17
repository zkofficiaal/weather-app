//
//  WeatherRow.swift
//  WeatherDemo
//
//  Created by Stephanie Diep on 2021-12-01.
//

import SwiftUI

struct WeatherRow: View {
    var logo: String
    var name: String
    var value: String
    
    var body: some View {
        HStack(spacing: 20) {
            Image(systemName: logo)
                .font(.title2)
                .frame(width: 20, height: 20)
                .padding()
                .background(Color(hue: 1.0, saturation: 0.0, brightness: 0.888))
                .cornerRadius(50)
            
            VStack(alignment: .leading, spacing: 8) {
                Text(name)
                    .font(.caption)
                Text(value)
                    .bold()
                    .font(.title)
            }
        }
    }
}

#Preview {
    WeatherRow(
        logo: "thermometer",
        name: "Feels like",
        value: "8°"
    )
}
