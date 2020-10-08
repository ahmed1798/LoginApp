//
//  RoundedImage.swift
//  FBLoginApp
//
//  Created by Eissa on 10/2/20.
//  Copyright © 2020 Eissa. All rights reserved.
//

import UIKit
@IBDesignable
class RoundedImage: UIImageView {

    @IBInspectable var cornerRaduis: CGFloat = 3.0 {
        didSet {
            self.layer.cornerRadius = cornerRaduis
        }
    }
    override func awakeFromNib() {
        self.layer.cornerRadius = cornerRaduis
        self.clipsToBounds = true
    }

    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        self.layer.cornerRadius = cornerRaduis
        self.clipsToBounds = true
    }
}
