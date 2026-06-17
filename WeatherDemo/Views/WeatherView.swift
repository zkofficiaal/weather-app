//
//  WeatherView.swift
//  WeatherDemo
//
//  Created by Z.K   on 16/06/2026.
//
import SwiftUI

struct WeatherView: View {
    var weather: ResponseBody
    var body: some View {
        ZStack(alignment: .leading){
            VStack{
                VStack(alignment: .leading, spacing: 5){
                    Text(weather.name)
                        .bold().font(.title)
                    Text("Today\(Date().formatted(.dateTime.month().day().hour().minute()))")
                        .fontWeight(.light)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                Spacer()
                
                VStack{
                    HStack{
                        VStack(spacing: 20){
                            Image(systemName: "sun.max")
                                .font(.system(size: 40))
                            
                            Text(weather.weather[0].main)
                        }
                        .frame(width: 100 , alignment: .leading)
                        
                        Spacer()
                        
                        Text(weather.main.feels_like.roundDouble() + "º")
                            .font(.system(size: 100))
                            .fontWeight(.bold)
                            .padding()
                    }
                    
                    Spacer()
                        .frame(height: 80)
                    
                    AsyncImage(url: URL(string: "https://upload.wikimedia.org/wikipedia/commons/thumb/1/11/Melbourne_Skyline_and_Princes_Bridge_-_Dec_2008.jpg/1920px-Melbourne_Skyline_and_Princes_Bridge_-_Dec_2008.jpg")) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 350)
                            .clipShape(RoundedCorner(radius: 1200, corners: [.topLeft, .topRight]))
                    } placeholder: {
                        ProgressView()
                    }
                    
                    Spacer()
                    
                }
                .frame(maxWidth: .infinity)
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            
            VStack {
                Spacer()
                
                VStack(alignment: .leading, spacing: 20){
                    Text("Weather now")
                        .bold().padding(.bottom)
                    
                    HStack {
                        WeatherRow(logo: "thermometer", name: "Min temp", value: weather.main.temp_min.roundDouble()+"º")
                        
                        Spacer()
                        
                        WeatherRow(logo: "thermometer", name: "Max temp", value: weather.main.temp_max.roundDouble()+"º")
                        
                    }
                    HStack {
                        WeatherRow(logo: "wind", name: "Wind Speed", value: weather.wind.speed.roundDouble()+"m/s")
                        
                        Spacer()
                        
                        WeatherRow(logo: "humidity", name: "Humidity", value: weather.main.humidity.roundDouble()+"%")
                        
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .padding(.bottom, 20)
                .foregroundColor(Color(hue: 0.656, saturation: 0.787, brightness: 0.354))
                .background(.white)
                .cornerRadius(20, corners: [.topLeft, .topRight])
            }
        }
        .edgesIgnoringSafeArea(.bottom)
        .background(Color(hue: 0.656, saturation: 0.787, brightness: 0.354))
        .preferredColorScheme(.dark)
    }
}


    #Preview {
        WeatherView(weather: ResponseBody(
            coord: CoordinatesResponse(lon: 32.0, lat: 70.0),
            weather: [WeatherResponse(id: 800, main: "Clear", description: "clear sky", icon: "01d")],
            main: MainResponse(temp: 30.0, feels_like: 29.0, temp_min: 28.0, temp_max: 32.0, pressure: 1012, humidity: 40),
            name: "Bannu",
            wind: WindResponse(speed: 3.5, deg: 180)
        ))
    }
