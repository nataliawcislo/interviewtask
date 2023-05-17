//
//  WeatherService.swift
//  interTask
//
//  Created by Natalia Wcislo on 16.05.23.
//

import Foundation

class WeatherService : ObservableObject{

    @Published var results = [WeatherModel]()
    
    let urlapi = "https://api.open-meteo.com/v1/forecast?latitude=52.40&longitude=13.07&daily=weathercode,temperature_2m_max,temperature_2m_min&current_weather=true&past_days=1&timezone=Europe%2FBerlin"
    
//    let url = "https://api.open-meteo.com/v1/forecast?latitude=52.52&longitude=13.41&current_weather=true"
    
    func getDate(completion: @escaping ([WeatherModel]) -> ()){
        guard let url = URL(string: urlapi) else {
                    print("Invalid url...")
                    return
                }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
              let results = try! JSONDecoder().decode(WeatherModel.self, from: data!)
              print(results)
              DispatchQueue.main.async {
                  completion([results])
              }
          }.resume()
          
      }
  }
