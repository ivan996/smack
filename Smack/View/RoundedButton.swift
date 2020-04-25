//
//  RoundedButton.swift
//  Smack
//
//  Created by Ivan Stanimirovic on 25/04/2020.
//  Copyright © 2020 Ivan Stanimirovic. All rights reserved.
//

import UIKit

@IBDesignable
class RoundedButton: UIButton {

    required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
        layer.cornerRadius = 3.0
    }
    @IBInspectable var cornerRadius: CGFloat = 3.0{
        didSet{
            self.layer.cornerRadius = cornerRadius
        }
    }
    func setupView(){
        self.layer.cornerRadius = cornerRadius
    }

}
