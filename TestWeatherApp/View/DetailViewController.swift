//
//  DetailViewController.swift
//  TestWeatherApp
//
//  Created by Александр Уткин on 04.08.2021.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var conditionLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
           
    @IBOutlet weak var pressureValueLabel: UILabel!
    @IBOutlet weak var windSpeedValueLabel: UILabel!
    @IBOutlet weak var minTempValueLabel: UILabel!
    @IBOutlet weak var maxTempValueLabel: UILabel!
    
    var weatherModel: Weather?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        refreshLabels()
    }
    
    func refreshLabels() {
        cityNameLabel.text = weatherModel?.name
        conditionLabel.text = weatherModel?.conditionString
        if let temp = weatherModel?.temperature {
            temperatureLabel.text = "\(temp)"
        }
        if let pressureMm = weatherModel?.pressureMm {
            pressureValueLabel.text = "\(pressureMm)"
        }
        if let windSpeed = weatherModel?.windSpeed {
            windSpeedValueLabel.text = "\(windSpeed)"
        }
        if let tempMin = weatherModel?.tempMin {
            minTempValueLabel.text = "\(tempMin)"
        }
        if let tempMax = weatherModel?.tempMax {
            maxTempValueLabel.text = "\(tempMax)"
        }
    }
}
