//
//  DetailViewController.swift
//  TestWeatherApp
//
//  Created by Александр Уткин on 04.08.2021.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
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
        temperatureLabel.text = "\(weatherModel?.temperature)"
        pressureValueLabel.text = "\(weatherModel?.pressureMm)"
        windSpeedValueLabel.text = "\(weatherModel?.windSpeed)"
        minTempValueLabel.text = "\(weatherModel?.tempMin)"
        maxTempValueLabel.text = "\(weatherModel?.tempMax)"
        
        guard let url = URL(string: "https://yastatic.net/weather/i/icons/funky/dark/\((weatherModel?.conditionCode)!).svg") else { return }
        
        let session = URLSession.shared
        session.dataTask(with: url) { (data, responce, error) in
            if let error = error {
                return
            }
            if let data = data {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self.imageView.image = image
                        self.imageView.clipsToBounds = true
                    }
                }
            }
        }.resume()
    }
}
