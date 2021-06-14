//
//  GetForecast.swift
//  forecast
//
//  Created by Ильшат Мухамедьянов on 31.05.2021.
//

import Foundation
import Alamofire

class GetForecast {
    func forecastLoader(completion: @escaping (WeatherStruct)->Void) {
        let urlToForecast = "https://api.openweathermap.org/data/2.5/onecall?lat=52.467&lon=58.250&units=metric&appid=db07d26a667d7eac9af1a6b24718276e&lang=ru"
        AF.request(urlToForecast).responseDecodable(of: WeatherStruct.self) { response in
            guard let forecasts = response.value else {return}
            completion(forecasts)
        }
    }

}
