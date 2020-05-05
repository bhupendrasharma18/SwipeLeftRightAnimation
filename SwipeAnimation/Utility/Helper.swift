//
//  Helper.swift
//  SwipeAnimation
//
//  Created by Bhupendra Sharma on 05/05/20.
//  Copyright © 2020 Bhupendra. All rights reserved.
//

import Foundation
import UIKit

extension CGFloat {
    static var random: CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
}

extension UIColor {
    static var random: UIColor {
        return UIColor(red: .random, green: .random, blue: .random, alpha: 1.0)
    }
}
