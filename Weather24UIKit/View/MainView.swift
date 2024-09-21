//
//  MainView.swift
//  Weather24UIKit
//
//  Created by Borys Klykavka on 21.09.2024.
//

import UIKit
import MapKit

class MainView: UIView {
    
    weak public var delegate: MainViewControllerDelegate?
    
    let labelCounrty = UILabel()
    let latitudeTextField = UITextField()
    let longitudeTextField = UITextField()
    let fetchWeatherButton = UIButton(type: .system)

    
    // MARK: - Init and Deinit

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupView()
        setupGradientBackground()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setConstraints()
        if let gradientLayer = self.layer.sublayers?.first as? CAGradientLayer {
                 gradientLayer.frame = self.bounds
             }
    }
    
    // MARK: - Public Methods
    
    public func updateWeatherLabel(with country: String) {
           labelCounrty.text = "Country: \(country)"
    }
    
    private func setupView() {
            // Налаштування лейблу
            labelCounrty.textAlignment = .center
            labelCounrty.text = "Weather Info"
            self.addSubview(labelCounrty)
            
            // Налаштування текстових полів
            latitudeTextField.placeholder = "Enter latitude"
            latitudeTextField.borderStyle = .roundedRect
            latitudeTextField.keyboardType = .decimalPad
            self.addSubview(latitudeTextField)
            
            longitudeTextField.placeholder = "Enter longitude"
            longitudeTextField.borderStyle = .roundedRect
            longitudeTextField.keyboardType = .decimalPad
            self.addSubview(longitudeTextField)
            
            // Налаштування кнопки
            fetchWeatherButton.setTitle("Get Weather", for: .normal)
            fetchWeatherButton.addTarget(self, action: #selector(handleButtonTapped), for: .touchUpInside)
            self.addSubview(fetchWeatherButton)
        }
    
    private func setupGradientBackground() {
          let gradientLayer = CAGradientLayer()
          gradientLayer.colors = [
              UIColor.cyan.cgColor,
              UIColor.blue.cgColor
          ]
          gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
          gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
          gradientLayer.frame = self.bounds
          
          self.layer.insertSublayer(gradientLayer, at: 0)
      }
    
    @objc private func handleButtonTapped() {
        print(#function)
        guard let latitude = Double(latitudeTextField.text ?? ""),
              let longitude = Double(longitudeTextField.text ?? "") else {
            labelCounrty.text = "Invalid coordinates"
            return
        }
        delegate?.fetchWeather(value: CLLocationCoordinate2D(latitude: latitude, longitude: longitude))
    }
    
    private func setConstraints() {
            labelCounrty.translatesAutoresizingMaskIntoConstraints = false
            latitudeTextField.translatesAutoresizingMaskIntoConstraints = false
            longitudeTextField.translatesAutoresizingMaskIntoConstraints = false
            fetchWeatherButton.translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint.activate([
                labelCounrty.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 20),
                labelCounrty.centerXAnchor.constraint(equalTo: self.centerXAnchor),
                
                latitudeTextField.topAnchor.constraint(equalTo: labelCounrty.bottomAnchor, constant: 20),
                latitudeTextField.centerXAnchor.constraint(equalTo: self.centerXAnchor),
                latitudeTextField.widthAnchor.constraint(equalToConstant: 200),
                
                longitudeTextField.topAnchor.constraint(equalTo: latitudeTextField.bottomAnchor, constant: 10),
                longitudeTextField.centerXAnchor.constraint(equalTo: self.centerXAnchor),
                longitudeTextField.widthAnchor.constraint(equalToConstant: 200),
                
                fetchWeatherButton.topAnchor.constraint(equalTo: longitudeTextField.bottomAnchor, constant: 20),
                fetchWeatherButton.centerXAnchor.constraint(equalTo: self.centerXAnchor)
            ])
        }
}
