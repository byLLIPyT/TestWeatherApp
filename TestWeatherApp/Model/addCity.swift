//
//  addCity.swift
//  TestWeatherApp
//
//  Created by Александр Уткин on 05.08.2021.
//

import UIKit

extension UIViewController {
    
    func alertPlusCity(name: String, placeholder: String, completionHandler: @escaping (String) -> Void) {
        
        let alert = UIAlertController(title: name, message: "Add city?", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default) { (action) in
            
            let textAlert = alert.textFields?.first
            guard let text = textAlert?.text else { return }
            completionHandler(text)
        }
        
        alert.addTextField { (textFiled) in
            textFiled.placeholder = placeholder
        }
        
        let alertCancel = UIAlertAction(title: "Cancel", style: .default) { (_) in}
        alert.addAction(okAction)
        alert.addAction(alertCancel)        
        present(alert, animated: true, completion: nil)
    }
}
