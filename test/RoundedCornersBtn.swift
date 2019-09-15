//
//  RoundedCornersBtn.swift
//  test
//
//  Created by Rustam  on 9/15/19.
//  Copyright © 2019 Rustam . All rights reserved.
//

import UIKit

class RoundedCornersBtn: UIButton {
    
    @IBInspectable var startColor: UIColor = #colorLiteral(red: 0.3568627451, green: 0.7098039216, blue: 0.737254902, alpha: 1) {
        didSet {
            self.setNeedsLayout()
        }
    }
    
    @IBInspectable var endColor: UIColor = #colorLiteral(red: 0.537254902, green: 0.8235294118, blue: 0.6549019608, alpha: 1) {
        didSet {
            self.setNeedsLayout()
        }
    }
    
    // функция для закругления углов и добавления градиентного цвета для кнопки
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.layer.cornerRadius = 25
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [startColor.cgColor, endColor.cgColor]
        gradientLayer.frame = layer.bounds
        gradientLayer.cornerRadius = 25
        gradientLayer.masksToBounds = true
        gradientLayer.startPoint = CGPoint(x: 0, y: 0.5)
        gradientLayer.endPoint = CGPoint (x: 1, y: 0.5)
        self.layer.insertSublayer(gradientLayer, at: 0)
      
     
    }
    
}
