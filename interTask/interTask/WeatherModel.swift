//
//  WeatherModel.swift
//  interTask
//
//  Created by Natalia Wcislo on 16.05.23.
//

import Foundation

struct WeatherModel: Codable, Identifiable {
    var id = UUID()
    let currentWeather: CurrentWeather
    let daily: Daily

    enum CodingKeys: String, CodingKey {
        case currentWeather = "current_weather"
        case daily
    }
}

// MARK: - CurrentWeather
struct CurrentWeather: Codable, Identifiable, Hashable {
    var id = UUID()
    let temperature: Double
    let time: String

    enum CodingKeys: String, CodingKey {
        case temperature
        case time
    }
}

// MARK: - Daily
struct Daily: Codable, Identifiable, Hashable {
    var id = UUID()
    let time: [String]
    let temperature2MMax, temperature2MMin: [Double]

    enum CodingKeys: String, CodingKey {
        case time
        case temperature2MMax = "temperature_2m_max"
        case temperature2MMin = "temperature_2m_min"
    }
}
