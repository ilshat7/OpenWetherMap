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
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        GetForecast().forecastLoader{ weather in
            self.weather = weather
            self.tableView.reloadData()
            guard let weather = self.weather else {return}
            self.icon.image = UIImage(named: weather.current.weather[0].icon)
            self.descriptionLabel.text = weather.current.weather[0].description
            self.currentTempLabel.text = "\(Int(round(weather.current.temp))) ºC"
            self.feelsLikeLabel.text = "Ощющается как: \(Int(round(weather.current.feels_like))) ºC"
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

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
