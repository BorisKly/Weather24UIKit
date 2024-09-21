//
//  NetworkManager.swift
//  Weather24UIKit
//
//  Created by Borys Klykavka on 21.09.2024.
//
import Foundation

struct CoordinateValue {
    var lat: Double
    var lon: Double
}

struct CityNameValue {
    var cityName: String
}

class NetworkManager {
    
    let key = ConfigValues.get().AccessKeys.accessKey
    let scheme = "https"
    let host = "api.openweathermap.org"
    
    public static let shared = NetworkManager()
   
    private init() {}

    public func weatherCoordinate(value: CLLocationCoordinate2D,
                        onSuccess: @escaping (WeatherData) -> (),
                        onError: @escaping (Error) ->()) {

        var components = URLComponents()
        components.scheme = scheme
        components.host = host
        components.path = NetworkApiMethods.weather.path
        let quertyItems: [URLQueryItem] = [
            URLQueryItem(name: "lat", value: String(value.latitude)),
            URLQueryItem(name: "lon", value: String(value.longitude)),
            URLQueryItem(name: "appid", value: key)
        ]
        
        components.queryItems = quertyItems
        guard let url = components.url else {
            return
        }
        print(url)
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
           
            if let error = error {
                print(error)
                onError(error)
                return
            }
            if let response = response {
                print(response)
            }
            
            guard let data = data,
                  let jsonString = try? JSONDecoder().decode(WeatherResponseData.self, from: data) else {
                print("Error - cannot get information from url");
                return}
            let viewData = WeatherData(country: jsonString.sys.country, temperature: jsonString.main.temp)
            onSuccess(viewData)
        }
        task.resume()
    }
 
}
