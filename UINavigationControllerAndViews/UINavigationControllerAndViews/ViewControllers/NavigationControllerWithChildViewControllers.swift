//
//  NavigationControllerWithChildViewControllers.swift
//  UINavigationControllerAndViews
//
//  Created by Shane O'Mahony on 19/01/2019.
//  Copyright © 2019 Shane O'Mahony. All rights reserved.
//

import UIKit

class NavigationControllerWithChildViewControllers : UINavigationController {
    
    let firstViewController = UIViewController()
    var dismissAction: () -> Void = {}
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        
        firstViewController.view.addSubview({
            let label = UILabel(frame: CGRect(x: 70, y: 70, width: 150, height: 50))
            label.text = "first view controller"
            label.textColor = .black
            label.backgroundColor = .white
            return label
            }())
        
        firstViewController.view.addSubview({
            let button = UIButton(frame: CGRect(x: 60, y: 150, width: 200, height: 50))
            button.backgroundColor = .black
            button.setTitleColor(.white, for: .normal)
            button.setTitle("Dismiss", for: .normal)
            button.addTarget(self, action: #selector(myDismissAction), for: .touchUpInside)
            
            return button
            }())
        
        self.addChild(firstViewController)
    }
    
    @objc func myDismissAction() {
        self.dismissAction()
    }
}
