//
//  TableViewCell.swift
//  TestWeatherApp
//
//  Created by Александр Уткин on 04.08.2021.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var nameCityLabel: UILabel!
    @IBOutlet weak var conditionLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    
    func configure(weather: Weather)  {
        self.nameCityLabel.text = weather.name
        self.conditionLabel.text = weather.conditionString
        self.temperatureLabel.text = weather.temperatureString
    }    
}
