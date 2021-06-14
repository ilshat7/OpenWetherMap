//
//  WeatherTableViewCell.swift
//  OpenWetherMap
//
//  Created by Ильшат Мухамедьянов on 13.06.2021.
//

import UIKit

class WeatherTableViewCell: UITableViewCell {
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var icon: UIImageView!
    


    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func setCell (data: Daily){
        
        let dayFormat = DateFormatter()
        let date = Date(timeIntervalSince1970: TimeInterval(data.dt))
        dayFormat.locale = Locale(identifier: "ru_Ru")
        dayFormat.dateFormat = "E d MMM"
        let day = dayFormat.string(from: date)
        dayLabel.text = "\(day)"
        
        tempLabel.text = "\(lroundf(data.temp.max))/\(lroundf(data.temp.min))ºC"
        
        icon.image = UIImage(named: "\(data.weather[0].icon)")
    }
    
}
