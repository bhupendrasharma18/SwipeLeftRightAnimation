//
//  ViewController.swift
//  SwipeAnimation
//
//  Created by Bhupendra Sharma on 04/05/20.
//  Copyright © 2020 Bhupendra. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var myView = UIView()
    var panGestureRecognizer: UIPanGestureRecognizer!
    var xFromCenter: CGFloat!
    var yFromCenter: CGFloat!
    var originalPoint: CGPoint!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let width = UIScreen.main.bounds.width
        view.addSubview(myView)
        myView.frame = CGRect.init(x: (width - 300) / 2, y: 100, width: 300, height: 300)
        myView.translatesAutoresizingMaskIntoConstraints = true
        myView.backgroundColor = .red
        
        panGestureRecognizer = UIPanGestureRecognizer.init(target: self, action:  #selector(self.beingDragged(_:)))
        myView.addGestureRecognizer(panGestureRecognizer)
    }

    @objc func beingDragged(_ gestureRecognizer: UIPanGestureRecognizer) {
        xFromCenter = gestureRecognizer.translation(in: self.myView).x
        yFromCenter = gestureRecognizer.translation(in: self.myView).y
        switch gestureRecognizer.state {
        case .began:
            originalPoint = myView.center
        case .changed:
            let ROTATION_STRENGTH = 320.0
            let ROTATION_MAX = 1.0
            let SCALE_STRENGTH = 4.0
            let SCALE_MAX = 0.93
            let rotationStrength = min(xFromCenter / CGFloat(ROTATION_STRENGTH), CGFloat(ROTATION_MAX))
            let rotationAngel = .pi/8 * rotationStrength
            let scale = max(1 - abs(rotationStrength) / CGFloat(SCALE_STRENGTH), CGFloat(SCALE_MAX))
            myView.center = CGPoint(x: originalPoint.x + xFromCenter, y: originalPoint.y + yFromCenter)
            let transforms = CGAffineTransform(rotationAngle: rotationAngel)
            let scaleTransform: CGAffineTransform = transforms.scaledBy(x: scale, y: scale)
            myView.transform = scaleTransform
            
        case .ended:
            afterSwipe()
            print("beingDragged ended")
            
        default:
            break
        }
    }
    
    func afterSwipe() {
        resetCardView()
    }
    
    func resetCardView() {
        UIView.animate(withDuration: 0.5) {
            self.myView.center = self.originalPoint
            self.myView.transform = CGAffineTransform.init(rotationAngle: 0)
        }
    }
}

