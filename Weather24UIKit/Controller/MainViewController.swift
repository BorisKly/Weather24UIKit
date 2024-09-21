//
//  ViewController.swift
//  Weather24UIKit
//
//  Created by Borys Klykavka on 21.09.2024.
//

import UIKit

protocol  MainViewControllerDelegate: AnyObject {
    func doSmth()
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
    }
    
    func doSmth() {
    }


}

