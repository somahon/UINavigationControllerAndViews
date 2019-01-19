//
//  ViewController.swift
//  UINavigationControllerAndViews
//
//  Created by Shane O'Mahony on 19/01/2019.
//  Copyright © 2019 Shane O'Mahony. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    let navigationViewController = NavigationControllerWithChildViewControllers()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        view.addSubview({
            let label = UILabel(frame: CGRect(x: 50, y: 50, width: 150, height: 50))
            label.text = "Main view controller"
            label.backgroundColor = .white
            label.textColor = .black
            
            return label
        }())
        
        let button = UIButton(frame: CGRect(x: 50, y: 100, width: 150, height: 50))
        button.setTitle("Show Navigation VC", for: .normal)
        button.backgroundColor = .black
        button.setTitleColor(.white, for: .normal)
        
        button.addTarget(self, action: #selector(self.showNavigationController), for: .touchUpInside)
        view.addSubview(button)
        
        UIView.animate(withDuration: 0.5) {
            button.frame.origin.y += 30
        }
        
        navigationViewController.dismissAction = {
            self.dismiss(animated: true, completion: nil)
        }
    }

    @objc func showNavigationController() {
        self.present(navigationViewController, animated: true)
    }
}

