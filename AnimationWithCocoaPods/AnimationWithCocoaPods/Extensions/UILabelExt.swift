//
//  UILabelExt.swift
//  AnimationWithCocoaPods
//
//  Created by Евгений Лойко on 4.10.23.
//

import UIKit

extension UILabel {
    
    func pulsate() {
        let pulsate = CASpringAnimation(keyPath: "transform.scale")
        pulsate.duration = 0.5
        pulsate.fromValue = 1.1
        pulsate.toValue = 0.9
        pulsate.autoreverses = true
        pulsate.initialVelocity = 0.5
        pulsate.damping = 0.5
        layer.add(pulsate, forKey: nil)
    }
}
