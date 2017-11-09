//
//  RoundedButton.swift
//  Smack
//
//  Created by vince zipparro on 11/9/17.
//  Copyright © 2017 vince zipparro. All rights reserved.
//

import UIKit

@IBDesignable
class RoundedButton: UIButton
{
    @IBInspectable var cornerRadius: CGFloat = 3.0
    {
        didSet
        {
            self.layer.cornerRadius = cornerRadius
        }
    }
    
    
    override func awakeFromNib() {
        self.setupView()
    }
    
    override func prepareForInterfaceBuilder()
    {
        super.prepareForInterfaceBuilder()
        self.setupView()
    }
    
    func setupView()
    {
        self.layer.cornerRadius = cornerRadius
    }
}
