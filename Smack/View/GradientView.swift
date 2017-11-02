//
//  GradientView.swift
//  Smack
//
//  Created by vince zipparro on 11/2/17.
//  Copyright © 2017 vince zipparro. All rights reserved.
//

import UIKit

@IBDesignable
class GradientView: UIView
{
    //sets top color
    @IBInspectable var topColor: UIColor = #colorLiteral(red: 0.2901960784, green: 0.3019607843, blue: 0.8470588235, alpha: 1)
    {
        didSet
        {
            self.setNeedsLayout()
        }
    }
    
    //sets bottom color
    @IBInspectable var bottomColor: UIColor = #colorLiteral(red: 0.1725490196, green: 0.831372549, blue: 0.8470588235, alpha: 1)
        {
        didSet
        {
            self.setNeedsLayout()
        }
    }
    
    override func layoutSubviews()
    {
        //CAGradientLayer takes an array of colors
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [topColor.cgColor, bottomColor.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        //sets to the size of the UIView
        gradientLayer.frame = self.bounds
        
        //adds layer to UIView layer
        self.layer.insertSublayer(gradientLayer, at: 0)
    }
    

}
