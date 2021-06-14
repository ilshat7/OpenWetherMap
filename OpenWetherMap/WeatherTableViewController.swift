//
//  WeatherTableViewController.swift
//  OpenWetherMap
//
//  Created by Ильшат Мухамедьянов on 13.06.2021.
//

import UIKit

class WeatherTableViewController: UITableViewController {
    var weather: WeatherStruct?
    
    @IBOutlet weak var currentTempLabel: UILabel!
    @IBOutlet weak var feelsLikeLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var Label1: UILabel!
    @IBOutlet weak var Label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var label4: UILabel!
    @IBOutlet weak var label5: UILabel!
    @IBOutlet weak var label6: UILabel!
    @IBOutlet weak var hourlyCollectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        GetForecast().forecastLoader{ weather in
            self.weather = weather
            self.tableView.reloadData()
            self.hourlyCollectionView.reloadData()
            guard let weather = self.weather else {return}
            self.icon.image = UIImage(named: weather.current.weather[0].icon)
            self.descriptionLabel.text = weather.current.weather[0].description
            self.currentTempLabel.text = "\(lroundf(weather.current.temp)) ºC"
            self.feelsLikeLabel.text = "Ощющается как: \(lroundf(weather.current.feels_like)) ºC"
            self.Label1.text = "Ветер: \(weather.current.wind_speed)м/с"
            self.Label2.text = "Влажность: \(weather.current.humidity)%"
            self.label3.text = "UV-индекс: \(weather.current.uvi)"
            self.label4.text = "Давление: \(weather.current.pressure)hPa"
            self.label5.text = "Видимость: \(weather.current.visibility)км"
            self.label6.text = "Облачность: \(weather.current.clouds)"
        }
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let showVC = segue.destination as? ShowDetailTableViewController else { return }
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        showVC.data = weather?.daily[indexPath.row]
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weather?.daily.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! WeatherTableViewCell

        cell.setCell(data: weather!.daily[indexPath.row])

        return cell
    }

    

}
extension WeatherTableViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       return weather?.hourly.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "hourly", for: indexPath) as! HourlyCollectionViewCell
        if let hourlyWeather = weather?.hourly[indexPath.row] {
            
            let hour = Date(timeIntervalSince1970: TimeInterval(hourlyWeather.dt))
            let hourFormatter = DateFormatter()
            hourFormatter.dateFormat = "HH:mm"
            cell.hourLabel.text = hourFormatter.string(from: hour)
            
            let date = Date(timeIntervalSince1970: TimeInterval(hourlyWeather.dt))
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd.MM"
            cell.dateLabel.text = dateFormatter.string(from: date)
            cell.tempLabel.text = "\(lroundf(hourlyWeather.temp))ºC"
            cell.icon.image = UIImage(named: hourlyWeather.weather[0].icon)
        }
        return cell
    }
    
    
}
