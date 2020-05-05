//
//  CardView.swift
//  SwipeAnimation
//
//  Created by Bhupendra Sharma on 05/05/20.
//  Copyright © 2020 Bhupendra. All rights reserved.
//

import UIKit

class CardView: UIView {

    var panGestureRecognizer: UIPanGestureRecognizer!
    var xFromCenter: CGFloat!
    var yFromCenter: CGFloat!
    var originalPoint: CGPoint!
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupView()
        addPanGesture()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setupView() {
        layer.cornerRadius = 8.0
        layer.shadowRadius = 3.0
        layer.shadowOpacity = 0.2
        layer.shadowOffset = CGSize.init(width: 1.0, height: 1.0)
    }
    
    private func addPanGesture() {
        panGestureRecognizer = UIPanGestureRecognizer.init(target: self, action:  #selector(self.beingDragged(_:)))
        addGestureRecognizer(panGestureRecognizer)
    }
    
    @objc func beingDragged(_ gestureRecognizer: UIPanGestureRecognizer) {
        xFromCenter = gestureRecognizer.translation(in: self).x
        yFromCenter = gestureRecognizer.translation(in: self).y
        switch gestureRecognizer.state {
        case .began:
            originalPoint = center
        case .changed:
            let ROTATION_STRENGTH = 320.0
            let ROTATION_MAX = 1.0
            let SCALE_STRENGTH = 4.0
            let SCALE_MAX = 0.93
            let rotationStrength = min(xFromCenter / CGFloat(ROTATION_STRENGTH), CGFloat(ROTATION_MAX))
            let rotationAngel = .pi/8 * rotationStrength
            let scale = max(1 - abs(rotationStrength) / CGFloat(SCALE_STRENGTH), CGFloat(SCALE_MAX))
            center = CGPoint(x: originalPoint.x + xFromCenter, y: originalPoint.y + yFromCenter)
            let transforms = CGAffineTransform(rotationAngle: rotationAngel)
            let scaleTransform: CGAffineTransform = transforms.scaledBy(x: scale, y: scale)
            transform = scaleTransform
            
        case .ended:
            afterSwipe()
            
        default:
            break
        }
    }
    
    private func afterSwipe() {
        resetCardView()
    }
    
    private func resetCardView() {
        UIView.animate(withDuration: 0.5) {
            self.center = self.originalPoint
            self.transform = CGAffineTransform.init(rotationAngle: 0)
        }
    }
    
}
