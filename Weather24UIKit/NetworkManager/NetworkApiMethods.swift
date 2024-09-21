//
//  NetworkApiMethods.swift
//  Weather24UIKit
//
//  Created by Borys Klykavka on 21.09.2024.
//
import Foundation

enum NetworkApiMethods: String {
    
    case weather = "weather"
    case airPollution = "air_pollution"
    
    var path: String {
        let generalPath = #"/data/2.5/"#
        return generalPath+self.rawValue
    }
    
}
