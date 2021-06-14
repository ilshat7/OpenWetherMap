//
//  ShowDetailTableViewController.swift
//  OpenWetherMap
//
//  Created by Ильшат Мухамедьянов on 13.06.2021.
//

import UIKit

class ShowDetailTableViewController: UITableViewController {
    
    var data: Daily?
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var descryptionLabel: UILabel!
    @IBOutlet weak var mornLabel: UILabel!
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var eveLabel: UILabel!
    @IBOutlet weak var nightLabel: UILabel!
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var label4: UILabel!
    @IBOutlet weak var label5: UILabel!
    @IBOutlet weak var label6: UILabel!
    @IBOutlet weak var label7: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        guard let data = data else { return }
        let dayFormat = DateFormatter()
        let date = Date(timeIntervalSince1970: TimeInterval(data.dt))
        dayFormat.locale = Locale(identifier: "ru_Ru")
        dayFormat.dateFormat = "EEEE d MMMM"
        let day = dayFormat.string(from: date)

        dateLabel.text = day
        icon.image = UIImage(named: "\(data.weather[0].icon)")
        descryptionLabel.text = data.weather[0].description
        mornLabel.text = "\(Int(data.temp.morn.rounded()))"
        dayLabel.text = "\(Int(data.temp.day.rounded()))"
        eveLabel.text = "\(Int(data.temp.eve.rounded()))"
        nightLabel.text = "\(Int(data.temp.night.rounded()))"
        label1.text = "Давление: \(data.pressure)"
        label2.text = "Влажность: \(data.humidity)"
        label3.text = "Вероятность осадков: \(data.pop)"
        label4.text = "Облачность: \(data.clouds)"
        label5.text = "УФ-индекс: \(data.uvi)"
        
        let sunrise = Date(timeIntervalSince1970: TimeInterval(data.sunrise))
        let sunriseFormatter = DateFormatter()
        sunriseFormatter.dateFormat = "HH:mm"
        
        label6.text = "Восход солнца: \(sunriseFormatter.string(from: sunrise))"
        
        let sunset = Date(timeIntervalSince1970: TimeInterval(data.sunset))
        let sunsetFormatter = DateFormatter()
        sunsetFormatter.dateFormat = "HH:mm"
        
        label7.text = "Закат солнца: \(sunsetFormatter.string(from: sunset))"
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 7
    }

}
