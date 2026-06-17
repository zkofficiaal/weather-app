//
//  WelcomeView.swift
//  WeatherDemo
//
//  Created by Z.K   on 15/06/2026.
//

import SwiftUI
import CoreLocationUI

struct WelcomeView: View {
    @EnvironmentObject var locationManager: LocationManager
    var body: some View {
        VStack {
            VStack(spacing: 20){
                Text("Welcome to the Wether app")
                    .bold().font(.title)
                Text ("Please share your current location to get the weahter in your area")
                    .padding()
            }
            .multilineTextAlignment(.center)
            .padding()
            
            LocationButton(.shareCurrentLocation){
                locationManager.requestLocation()
            }
            .cornerRadius(30)
            .symbolVariant(.fill)
            .foregroundColor(Color(.white))
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct Welcome_preview: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}

