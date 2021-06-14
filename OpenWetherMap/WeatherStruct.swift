//
//  WeatherStruct.swift
//  OpenWetherMap
//
//  Created by Ильшат Мухамедьянов on 13.06.2021.
//

import Foundation

struct WeatherStruct: Decodable {
    var current: Current
    var hourly: [Hourly]
    var daily: [Daily]
}

struct Current: Decodable {
    var dt: Int
    var sunrise: Int
    var sunset: Int
    var temp: Float
    var feels_like: Float
    var pressure: Int
    var humidity: Int
    var uvi: Float
    var clouds: Int
    var visibility: Int
    var wind_speed: Float
    var wind_deg: Int
    var weather: [Weather]
}

struct Hourly:Decodable {
    var dt: Int
    var temp: Float
    var weather: [Weather]
}

struct Daily: Decodable {
    var dt: Int
    var sunrise: Int
    var sunset: Int
    var temp: Temp
    var pressure: Int
    var humidity: Int
    var weather: [Weather]
    var clouds: Int
    var pop: Float
    var uvi: Float
}

struct Weather: Decodable {
    var description: String
    var icon: String
}

struct Temp: Decodable {
    var day: Float
    var min: Float
    var max: Float
    var night: Float
    var eve: Float
    var morn: Float
}
