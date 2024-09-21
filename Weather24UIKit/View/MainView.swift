//
//  MainView.swift
//  Weather24UIKit
//
//  Created by Borys Klykavka on 21.09.2024.
//

import UIKit

class MainView: UIView {
    
    weak public var delegate: MainViewControllerDelegate?

    let label = UILabel()
    
    // MARK: - Init and Deinit

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(label)
        self.backgroundColor = .cyan
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setConstraints()
    }
    
    // MARK: - Public Methods
    
    private func setConstraints() {
    }
}
