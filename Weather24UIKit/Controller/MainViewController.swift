//
//  ViewController.swift
//  Weather24UIKit
//
//  Created by Borys Klykavka on 21.09.2024.
//

import UIKit
import MapKit

protocol  MainViewControllerDelegate: AnyObject {
    func fetchWeather(value: CLLocationCoordinate2D)
}

class MainViewController: UIViewController,
                            MainViewControllerDelegate {
    
    private var mainView: MainView? {
        return self.view as? MainView
    }
    
    override func loadView() {
        let mainView = MainView(frame: CGRect.zero)
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainView?.delegate = self
    }
    
    func fetchWeather(value: CLLocationCoordinate2D) {
        print(#function)
        NetworkManager.shared.fetchWeather(value: value) { weatherData in
            print(weatherData.country)
            DispatchQueue.main.async {
                self.mainView?.updateWeatherLabel(with: "\(weatherData.country) \(weatherData.temperature)F")
                        }
        } onError: { error in
            print(error.localizedDescription)
        }

    }


}

