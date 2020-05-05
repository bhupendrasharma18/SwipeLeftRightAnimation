//
//  ViewController.swift
//  SwipeAnimation
//
//  Created by Bhupendra Sharma on 04/05/20.
//  Copyright © 2020 Bhupendra. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var containerView: SwipeViewContainer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createContainerView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        containerView.createCards(arr: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16])
    }
    
    private func createContainerView() {
        containerView = SwipeViewContainer.init()
        view.addSubview(containerView)
        containerView.layer.cornerRadius = 10.0
        containerView?.backgroundColor = .lightGray
        containerView.translatesAutoresizingMaskIntoConstraints = false
        Constraints.leadingConstraint(control: containerView, parent: view, constant: 10)
        Constraints.trailingConstraint(control: containerView, parent: view, constant: -10)
        Constraints.topConstraint(control: containerView, parent: view, constant: 70)
        Constraints.bottomConstraint(control: containerView, parent: view, constant: -50)
    }
}

