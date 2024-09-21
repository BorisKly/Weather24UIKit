//
//  WeatherResponseData.swift
//  Weather24UIKit
//
//  Created by Borys Klykavka on 21.09.2024.
//

import Foundation

// MARK: - Welcome
struct WeatherResponseData: Codable {
    // let coord: Coord
    //    let weather: [Weather]
    //    let base: String
    let main: Main
    //    let visibility: Int
    //    let wind: Wind
    //    let rain: Rain
    //    let clouds: Clouds
    //    let dt: Int
    let sys: Sys
    ///  let timezone, id: Int
    //   let name: String
    //  let cod: Int
}

// MARK: - Clouds
//struct Clouds: Codable {
//    let all: Int
//}

// MARK: - Coord
//struct Coord: Codable {
//    let lon, lat: Double
//}

// MARK: - Main
struct Main: Codable {
    let temp: Double
  //  let feelsLike: Double
//    let tempMin: Double
//    let tempMax: Double
    //let pressure, humidity, seaLevel, grndLevel: Int

    enum CodingKeys: String, CodingKey {
        case temp
//        case feelsLike = "feels_like"
//        case tempMin = "temp_min"
//        case tempMax = "temp_max"
//        case pressure, humidity
//        case seaLevel = "sea_level"
//        case grndLevel = "grnd_level"
    }
}

// MARK: - Rain
//struct Rain: Codable {
//    let the1H: Double
//
//    enum CodingKeys: String, CodingKey {
//        case the1H = "1h"
//    }
//}

// MARK: - Sys
struct Sys: Codable {
 //   let type, id: Int
    let country: String
  //  let sunrise, sunset: Int
}

// MARK: - Weather
//struct Weather: Codable {
//    let id: Int
//    let main: String
//    let    description: String
//    let      icon: String
//}

// MARK: - Wind
//struct Wind: Codable {
//    let speed: Double
//    let deg: Int
//    let gust: Double
//}
