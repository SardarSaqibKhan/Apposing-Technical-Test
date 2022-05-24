//
//  PrimaryGradientButton.swift
//  Apposing Technical Test
//
//  Created by sardar saqib on 24/05/2022.
//

import Foundation
import UIKit

final class PrimaryGradientButton: UIButton {

    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = bounds
    }

    private lazy var gradientLayer: CAGradientLayer = {
        let l = CAGradientLayer()
        l.frame = self.bounds
        l.colors = [UIColor.systemPink.cgColor, UIColor.orange.cgColor]
        l.shadowColor = UIColor.systemOrange.cgColor
        l.startPoint = CGPoint(x: 0, y: 0.5)
        l.endPoint = CGPoint(x: 1, y: 0.5)
        l.shadowColor = UIColor.systemPink.cgColor
        l.shadowOffset = CGSize(width: 0.0, height: 5.0)
        l.shadowRadius = 10.0
        l.shadowOpacity = 0.6
        l.masksToBounds = false
        l.cornerRadius = 22
        layer.insertSublayer(l, at: 0)
        return l
    }()
}
