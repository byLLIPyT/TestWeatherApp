//
//  TableViewController.swift
//  TestWeatherApp
//
//  Created by Александр Уткин on 30.07.2021.
//

import UIKit

class TableViewController: UITableViewController {
    
    var emptyCity = Weather()
    var citiesArray = [Weather]()
    var cities = ["Ставрополь","Екатеринбург","Тюмень","Краснодар","Новороссийск","Уфа","Пермь","Чита","Глазов","Омск","Минеральные воды"]
    
    let networkWeatherManager = NetworkWeatherManager()
               
    override func viewDidLoad() {
        super.viewDidLoad()
        if citiesArray.isEmpty {
            citiesArray = Array(repeating: emptyCity, count: cities.count)
        }
        addCities()
    }
    
    @IBAction func addNewCity(_ sender: Any) {
        
        alertPlusCity(name: "City", placeholder: "Enter city name") { (city) in
            self.cities.append(city)
            self.citiesArray.append(self.emptyCity)
            self.addCities()
        }
    }
    
    
    func addCities() {
        
        getCityWeather(citiesArray: cities) { (index, weather) in
            
            self.citiesArray[index] = weather
            self.citiesArray[index].name = self.cities[index]
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    // MARK: - Table view data source
   
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return citiesArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Settings.cellIdentifier.rawValue, for: indexPath) as! TableViewCell

        var weather = Weather()
        weather = citiesArray[indexPath.row]
        cell.configure(weather: weather)

        return cell
    }
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { (_, _, completionHandler) in
            
            let editionRow = self.cities[indexPath.row]
            if let index = self.cities.firstIndex(of: editionRow) {
                self.citiesArray.remove(at: index)
            }
            tableView.reloadData()
        }
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            guard let indexPath = tableView.indexPathForSelectedRow else { return }
            let cityWeather = citiesArray[indexPath.row]
            let destViewController = segue.destination as! DetailViewController
            destViewController.weatherModel = cityWeather
        }
    }
}
