//
//  CityWeatherInfo.swift
//  Weather App with MapKit
//
//  Created by Dmitry Novosyolov on 15/08/2019.
//  Copyright © 2019 Dmitry Novosyolov. All rights reserved.
//

import SwiftUI

struct CityWeatherInfo: View {
    var weather: WeatherData
    var body: some View {
        
        VStack(alignment: .leading, spacing: 5) {
            
            HStack {
                Text("🌡temperature:")
                    .font(.system(size: 20))
                    .foregroundColor(.secondary)
                    .shadow(color: .red, radius: 2)
    
         //  }
//            HStack {
                Text("💧humidity:")
                .font(.system(size: 20))
                    .foregroundColor(.secondary)
                    .shadow(color: .blue, radius: 2)
        
            //}
//            HStack {
//                Text("👓visibility:")
//                    .font(.title)
//                    .foregroundColor(.secondary)
//                    .shadow(color: .green, radius: 2)
//                Text("\(weather.visibility) met")
//                    .font(.custom("American Typewriter", size: 30))
//            }
//            HStack {
//                Text("🌀pressure:")
//                    .font(.title)
//                    .foregroundColor(.secondary)
//                    .shadow(color: .blue, radius: 2)
//                Text("\(String(format: "%.0f", weather.main.pressure)) mbar")
//                    .font(.custom("American Typewriter", size: 30))
//            }
//            HStack {
                Text("💨wind:")
                  .font(.system(size: 20))
                    .foregroundColor(.secondary)
                    .shadow(color: .blue, radius: 2)
            }.offset(x:25)
            VStack{
                
                HStack{
                    
                    Text("\(String(format: "%.0f", weather.main.temp))ºC")
                            .font(.custom("American Typewriter", size: 20))
                            .foregroundColor(.red)
                    Spacer()
                    Text("\(String(format: "%.0f", weather.main.humidity))%")
                                .font(.custom("American Typewriter", size: 20))
                                .foregroundColor(.blue)
                      Spacer()
                    Text("\(String(format: "%.0f", weather.wind.speed)) m/sec")
                                     .font(.custom("American Typewriter", size: 20))
                      Spacer()
                }.offset(x:40)
                Spacer()
            }
        }
        
    }
}
