//
//  ContentView.swift
//  interTask
//
//  Created by Natalia Wcislo on 16.05.23.
//

import SwiftUI
import Foundation

struct ContentView: View {
    //Since the response is an array of TaskEntry object
    @State var results = [WeatherModel]()

    var body: some View {
        
        ScrollView{
            VStack{
                ForEach(results, id: \.id) { result in
                    
                    Text("Potsdam")
                    Text("\(result.currentWeather.temperature)").font(.largeTitle)
                    Spacer()
                    Text("\(result.currentWeather.time)")
                    // how i can print min and max weather for next 7 days
                    Spacer()
                    HStack{
                        VStack{
                    
                            ForEach(1..<8) { index in
                                Text("\(result.daily.time[index])")
                            }
                        }
                        Spacer()
                        VStack{
                            Text("Maximum")
                            ForEach(1..<8) { index in
                            Text("\(result.daily.temperature2MMax[index])")
                            }
                        }
                        Spacer()
                        VStack{
                            Text("Minimum")
                            ForEach(1..<8) { index in
                            Text("\(result.daily.temperature2MMin[index])")
                            }
                        }
                    }.padding()
                }
            }
            
        }.onAppear() {
            WeatherService().getDate { (results) in
                self.results = results
                print("Check point")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



//      private func fetchData() {
//          //Parse URL
//          guard let url = URL(string: "https://api.open-meteo.com/v1/forecast?latitude=52.40&longitude=13.07&daily=weathercode,temperature_2m_max,temperature_2m_min&current_weather=true&past_days=1&timezone=Europe%2FBerlin") else { return }
//
//          URLSession.shared.dataTask(with: url) { data, _, error in
//              if let data = data {
//                  var result: WeatherModel
//                  do {
//                      //Parse JSON
//                     result = try JSONDecoder().decode(WeatherModel.self, from: data)
//                      print(result.daily.temperature2MMax)
//                      print(result.daily.temperature2MMin)
//                      print(result.currentWeather.temperature)
//                  } catch {
//                      //Print JSON decoding error
//                      print("Error decoding JSON: \(error.localizedDescription)")
//                  }
//              } else if let error = error {
//                  //Print API call error
//                  print("Error fetching data: \(error.localizedDescription)")
//              }
//          }.resume()
