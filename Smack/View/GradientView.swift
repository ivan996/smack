//
//  GradientView.swift
//  Smack
//
//  Created by Ivan Stanimirovic on 06/04/2020.
//  Copyright © 2020 Ivan Stanimirovic. All rights reserved.
//

import UIKit

@IBDesignable
class GradientView: UIView {

    @IBInspectable var topColor: UIColor = #colorLiteral(red: 0.2901960784, green: 0.3019607843, blue: 0.8470588235, alpha: 1) {
        //kada setujemo u storyboard-u onda se pozove ova funkcija
        didSet{
            self.setNeedsLayout()
        }
    }
    
    @IBInspectable var bottomColor: UIColor = #colorLiteral(red: 0.1725490196, green: 0.831372549, blue: 0.8470588235, alpha: 1) {
        //kada setujemo u storyboard-u onda se pozove ova funkcija
        didSet{
            self.setNeedsLayout()
        }
    }
    //kada se update-uje view onda se pozove ova f-ja
    override func layoutSubviews() {
        //za gradijent
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [topColor.cgColor,bottomColor.cgColor]
        //kako izgleda frame
        //00 01
        //10 11
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        gradientLayer.frame = self.bounds
        self.layer.insertSublayer(gradientLayer, at: 0)
    }
}
